class ChangeBadgeRules < ActiveRecord::Migration[5.2]
  def change
    remove_column :badge_rules, :badge_id, :integer
    remove_column :badge_rules, :user_id, :integer

    add_column :badge_rules, :badge_id, :integer
  end
end
