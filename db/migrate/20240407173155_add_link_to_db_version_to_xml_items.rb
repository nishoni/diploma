class AddLinkToDbVersionToXmlItems < ActiveRecord::Migration[7.0]
  def change
    change_table :xml_items do |t|
      t.references :db_version, foreign_key: { to_table: :db_versions }
    end
  end
end
