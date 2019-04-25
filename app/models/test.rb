class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :questions
  has_many :finished_tests
  has_many :users, through: :finished_tests

  def self.categories_titles(title)
    Test.joins(:category).where(categories: { title: title })
        .order(title: :desc).pluck(:title) 
  end
end
