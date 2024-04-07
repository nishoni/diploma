class ChangeGenderXmlItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :xml_items, :gender, null: true
  end
end
