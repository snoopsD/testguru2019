class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img_url, null: false

      t.timestamps                                        
    end
  end
end
