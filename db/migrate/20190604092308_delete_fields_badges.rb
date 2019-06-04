class DeleteFieldsBadges < ActiveRecord::Migration[5.2]
  def change
    remove_column :badges, :rule, :string
    remove_column :badges, :value, :string
  end
end
