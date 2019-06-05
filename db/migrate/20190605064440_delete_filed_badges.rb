class DeleteFiledBadges < ActiveRecord::Migration[5.2]
  def change
    remove_column :badges, :rule, :string
    remove_column :badges, :value, :string
    add_column :badges, :badge_rule_id, :integer
  end
end
