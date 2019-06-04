class AddRuleIdToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :badge_rule_id, :integer
  end
end
