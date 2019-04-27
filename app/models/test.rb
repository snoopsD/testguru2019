class Test < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :questions
  has_many :finished_tests
  has_many :users, through: :finished_tests

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to:  0 } 
  validates_uniqueness_of :title, scope: :level

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def categories_titles(title)
    Test.joins(:category).
    where(categories: { title: title }).
    order(title: :desc).pluck(:title)
  end
end
