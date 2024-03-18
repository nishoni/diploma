class LevensteinAlgorithm
  attr_accessor :search_field, :word, :user_id

  def initialize(search_field:, word:, user_id:)
    @search_field = search_field
    @word = word
    @user_id = user_id
  end  

  def perform
    levenshtein_distance
  end

  private

  # TODO: пока тут чистый Левенштейн, исправить на Дамерау-Левенштейн
  def damerau_levenshtein_distance
    search_field_length = search_field.length
    word_length = word.length

    return search_field_length if word_length == 0
    return word_length if search_field_length == 0

    matrix = [[0] * (word_length + 1)] * (search_field_length + 1)
  
    (0..search_field_length).each { |i| matrix[i][0] = i }
    (0..word_length).each { |j| matrix[0][j] = j }

    (1..word_length).each do |j|
      (1..search_field_length).each do |i|
        matrix[i][j] = if search_field_length[i - 1] == word_length[j - 1]  # adjust index into string
                         matrix[i - 1][j - 1]       # no operation required
                       else
                         [ matrix[i - 1][j] + 1,    # deletion
                           matrix[i][j - 1] + 1,    # insertion
                           matrix[i - 1][j - 1] + 1,  # substitution
                         ].min
                       end
      end
    end

    matrix[search_field_length][word_length]
  end
end