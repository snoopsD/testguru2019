class RemoveColumnTestIdUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :test_id
  end
end
