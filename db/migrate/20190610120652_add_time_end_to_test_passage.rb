class AddTimeEndToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :time_end, :datetime
  end
end
