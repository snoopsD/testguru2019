class Badge < ApplicationRecord

  has_many :badge_rules
  has_many :users, through: :badge_rules

end
