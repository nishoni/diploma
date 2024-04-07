class CreateXmlItems < ActiveRecord::Migration[7.0]
  def change
    create_table :xml_items do |t|
      t.string :gender, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.datetime :birth_date

      t.timestamps
    end
  end
end
