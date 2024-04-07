require 'csv'

class CsvExport
  attr_accessor :items

  def initialize(items:)
    @items = items
  end

  def perform
    return if items.blank?

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
      'Коэффициент'
    ]
  end

  # TODO: проверить структуру
  def row(item)
    [
      item["full_name"],
      item["coefficient"]
    ]
  end
end