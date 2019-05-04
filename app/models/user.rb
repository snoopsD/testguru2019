class User < ApplicationRecord

  has_many :own_tests, class_name: 'Test', foreign_key: :creator_id
  has_many :finished_tests
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def finish_tests(level)
    Test.joins(:test_passages)
        .where(test_passages: { user: self }, level: level)
        .distinct 
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
