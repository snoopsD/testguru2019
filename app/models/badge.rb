class Badge < ApplicationRecord
  
  has_many :user_badges
  has_many :users, through: :user_badges
  belongs_to :badge_rule

end
