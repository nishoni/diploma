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

  def column_names
    [
      'ID',
      'Основное имя',
      'Совпавшее имя',
      'Коэффициент'
    ]
  end

  def row(item)
    [
      item[:csl_id],
      item[:full_name],
      item[:fitted_name],
      item[:coefficient]
    ]
  end
end