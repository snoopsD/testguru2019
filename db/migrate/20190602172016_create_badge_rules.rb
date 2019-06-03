class CreateBadgeRules < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_rules do |t|
      
      t.integer :badge_id
      t.integer :user_id

      t.timestamps
    end
  end
end
