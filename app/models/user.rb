class User < ApplicationRecord
  has_many :finished_tests
  has_many :tests, through: :finished_tests

  def finished_tests(level)
    Test.joins(:finished_tests)
        .where(finished_tests: { user: self }, level: level)
        .distinct 
  end
end
