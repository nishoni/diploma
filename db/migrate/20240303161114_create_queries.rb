class CreateQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :queries do |t|
      t.string :word, :null => false
      t.datetime :time_start
      t.datetime :time_stop
      t.string :search_errors
      t.references :user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
