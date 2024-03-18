class AddSettingsColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :coefficient, :float, null: false, default: 0.6
    add_column :users, :max_result_count, :integer, null: false, default: 10
  end
end
