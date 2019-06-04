class AddColumnToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :time
  end
end
