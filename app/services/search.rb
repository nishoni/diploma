class Search
  attr_accessor :user_id, :search_field, :is_history

  ALPHABET = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]

  def initialize(search_field:, user_id:, is_history: false)
    @search_field = search_field
    @user_id = user_id
    @is_history = is_history
  end

  def perform
    @time_start = Time.zone.now

    query = user.queries.create!(word: search_field, time_start: @time_start) unless is_history
    fitted = false
    items

    # Тут вызов по элементам алгоритма
    beautify

    result_strings_count = 0
    fitted_coef = 0
    xml_items.each do |csl_id, words|
      break if result_strings_count >= user.max_result_count && user.max_result_count != -1

      words.each do |word|
        word = word.gsub(/[^A-Za-z]/, '').downcase

        next unless user.coefficient < pre_check(word) && user.coefficient < second_pre_check(word)

        distance = (search_field.length.to_f - DamerauLevensteinAlgorithm.new(search_field:, word:, user_id:).perform.to_f) / search_field.length

        if distance >= user.coefficient
          fitted = true
          fitted_coef = distance
          break
        end
      end

      if fitted
        result_strings_count += 1
        item = XmlItem.find_by(csl_id:)
        @items << {
          id: item.id,
          full_name: "#{item.first_name} #{item.last_name}".strip,
          coefficient: (fitted_coef * 100).round(2)
        }
        fitted = false
      end
    end
  rescue Exception => e
    query.search_errors = e unless is_history
  ensure
    @time_stop = Time.zone.now

    query.update(time_stop: @time_stop) unless is_history
  end

  def items
    @items ||= []
  end

  def statistics
    @statistics ||= {
      time_perform: (@time_stop - @time_start).round(4),
      count: items.count,
      volume: Marshal.dump(items).size
    }
  end

  private

  # Здесь удаляются лишние символы, приводятся к одному виду
  def beautify
    @search_field = @search_field.gsub(/[^A-Za-z]/, '').downcase!
  end

  def xml_items
    return @xml_items if @xml_items

    @xml_items = {}
    XmlItem.all.each do |item|
      @xml_items[item.csl_id] = [
          "#{item.first_name} #{item.last_name}".strip,
          item.aliases.map { |alias_item| "#{alias_item[:first_name]} #{alias_item[:last_name]}".strip }
        ].flatten
    end

    @xml_items
  end

  # Здесь первая препроверка
  def pre_check(word)
    alphabet_for_word = {}

    present = 0.0
    alphabet_map_for_field.each { |letter, is_in| present += 1 if is_in != 0 && word.include?(letter) }

    [present, word.each_char.tally.count].min / [present, word.each_char.tally.count].max
  end

  # Здесь вторая препроверка
  def second_pre_check(word)
    alphabet_for_word = {}

    matched = 0.0
    alphabet_map_for_field.each { |letter, count| matched += 1 if count == word.count(letter) }

    matched / ALPHABET.count
  end

  def alphabet_map_for_field
    return @alphabet_map_for_field if @alphabet_map_for_field

    @alphabet_map_for_field = {}

    ALPHABET.each { |letter| @alphabet_map_for_field[letter] = search_field.count(letter) }

    @alphabet_map_for_field
  end

  def user
    @user ||= User.find user_id
  end
end