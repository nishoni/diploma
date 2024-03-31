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

    # Тут вызов по элементам алгоритма
    beautify

    result_strings_count = 0
    words.each do |word|
      break if result_strings_count >= user.max_result_count
      next unless user.coefficient >= pre_check(word) || user.coefficient >= second_pre_check(word)

      distance = DamerauLevensteinAlgorithm.new(search_field:, word:, user_id:).perform
      if distance >= user.coefficient
        result_strings_count += 1
        @items << word
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
      count: items.count
    }
  end

  private

  # Здесь удаляются лишние символы, приводятся к одному виду
  def beautify
    @search_field.gsub(/[^A-Za-z]/, '').downcase!
  end

  # Пока заглушка
  def words
    @words ||= {}
  end

  # Здесь первая препроверка
  def pre_check(word)
    alphabet_for_word = {}

    present = 0
    alphabet_map_for_field.each { |letter, is_in| present += 1 if is_in != 0 && word.include?(letter) }

    present / ALPHABET.count
  end

  # Здесь вторая препроверка
  def second_pre_check(word)
    alphabet_for_word = {}

    matched = 0
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