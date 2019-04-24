class AddUsersColumnCurrentTest < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_test, :integer, :default => 0 
  end
end
