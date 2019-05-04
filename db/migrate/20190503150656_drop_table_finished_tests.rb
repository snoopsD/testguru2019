class DropTableFinishedTests < ActiveRecord::Migration[5.2]
  def change
    drop_table :finished_tests
  end
end
