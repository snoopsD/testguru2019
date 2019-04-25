class AddCreatorToTest < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tests, :users, column: :creator_id
  end
end
