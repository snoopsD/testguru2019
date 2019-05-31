class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :message, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
