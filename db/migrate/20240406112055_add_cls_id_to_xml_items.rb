class AddClsIdToXmlItems < ActiveRecord::Migration[7.0]
  def change
    add_column :xml_items, :csl_id, :integer, unique: true, null: false
  end
end
