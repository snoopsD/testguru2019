class ChangeBadgeRules < ActiveRecord::Migration[5.2]
  def change
    add_column :badge_rules, :badge_id, :integer
  end
end
