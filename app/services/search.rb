class Search
  def initialize(search_field:, user_id:)
    @search_field = search_field
    @user_id = user_id
  end

  def perform
    @time_start = Time.zone.now

    # Тут вызов по элементам алгоритма

    @time_stop = Time.zone.now
  end

  def items
    @items ||= []
  end

  def statistics
    @statistics ||= {
      time_perform: @time_stop - @time_start,
      count: items.count
    }
  end

  private
end