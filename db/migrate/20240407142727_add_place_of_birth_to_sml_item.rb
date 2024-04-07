class AddPlaceOfBirthToSmlItem < ActiveRecord::Migration[7.0]
  def change
    add_column :xml_items, :place_of_birth, :datetime, null: false
  end
end
