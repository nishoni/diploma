class AddArraysXmlItems < ActiveRecord::Migration[7.0]
  def change
    add_column :xml_items, :aliases, :text, array: true
    add_column :xml_items, :roles, :text, array: true
    add_column :xml_items, :addresses, :text, array: true
  end
end
