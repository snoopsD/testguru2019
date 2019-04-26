class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :category_sort, -> { order(title: :ASC) }
end
