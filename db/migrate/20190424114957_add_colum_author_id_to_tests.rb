class AddColumAuthorIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :creator_id, :integer
  end
end
