require 'csv'

class CsvExport
  attr_accessor :items

  def initialize(items:)
    @items = items
  end

  def perform
    CSV.generate do |csv|
      csv << column_names

      items.each do |item|
        csv << row(item)
      end
    end
  end

  private

  # TODO: проверить структуру
  def column_names
    [
      'Имя',
      'Работа',
      'Возраст'
    ]
  end

  # TODO: проверить структуру
  def row(item)
    [
      item["fullName"],
      item["profession"],
      item["age"]
    ]
  end
end