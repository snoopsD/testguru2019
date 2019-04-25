class User < ApplicationRecord
  has_many :own_tests, class_name: 'Test', foreign_key: :creator_id
  has_many :finished_tests
  has_many :tests, through: :finished_tests

  def finish_tests(level)
    Test.joins(:finished_tests)
        .where(finished_tests: { user: self }, level: level)
        .distinct 
  end
end
