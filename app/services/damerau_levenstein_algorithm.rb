class DamerauLevensteinAlgorithm
  attr_accessor :search_field, :word, :user_id

  def initialize(search_field:, word:, user_id:)
    @search_field = search_field
    @word = word
    @user_id = user_id
  end  

  def perform
    damerau_levenshtein_distance
  end

  private

  def damerau_levenshtein_distance
    word_l = word.length
    search_l = search_field.length
    matrix = Array.new(word_l + 1, [])
    matrix.each_index { |row| matrix[row] = Array.new(search_l + 1, 0) }
  
    (0..word_l).each { |dist| matrix[dist][0] = dist }
    (0..search_l).each { |dist| matrix[0][dist] = dist }
  
    cost = 0
    (1..word_l).each do |i|
      (1..search_l).each do |j|
        cost = word[i] == search_field[j] ? 0 : 1
  
        matrix[i][j] = [
          matrix[i - 1][j] + 1,
          matrix[i][j - 1] + 1,
          matrix[i - 1][j - 1] + cost
        ].min
  
        if word[i] == search_field[j - 1] && word[i - 1] == search_field[j]
          matrix[i][j] = [matrix[i][j], matrix[i - 2][j - 2] + 1].min
        end
      end
    end
  
    matrix[word_l][search_l]
  end
end