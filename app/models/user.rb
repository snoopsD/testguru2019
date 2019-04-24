class User < ApplicationRecord
  has_many :tests, foreign_key: :creator_id
  has_many :finished_tests
  has_many :tests, through: :finished_tests
  has_many :tests_users
  has_many :tests, through: :tests_users

  def finish_tests(level)
    Test.joins(:finished_tests)
        .where(finished_tests: { user: self }, level: level)
        .distinct 
  end
end
