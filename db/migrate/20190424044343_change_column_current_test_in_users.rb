class ChangeColumnCurrentTestInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :current_test, :test_id
    change_column :users, :test_id, :integer, default: 0
  end
end
