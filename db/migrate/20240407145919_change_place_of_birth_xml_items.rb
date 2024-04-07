class ChangePlaceOfBirthXmlItems < ActiveRecord::Migration[7.0]
  def change
    change_column :xml_items, :place_of_birth, :text
  end
end
