class CreateDbVersions < ActiveRecord::Migration[7.0]
  def change
    create_table :db_versions do |t|
      t.integer :version, null: false
      t.integer :new_items_created, default: 0
      t.boolean :current, default: true, null: false
      t.references :user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
