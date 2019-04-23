class User < ApplicationRecord
  def finished_tests(level)
    current = Test.joins("JOIN users ON tests.id = users.current_test and users.id = #{self.id}").
    where('level = ?', level).pluck(:title)

    finished = Test.joins("JOIN finished_tests,users ON
      finished_tests.test_id =  tests.id 
      and finished_tests.user_id = #{self.id}").where('level = ?', level).distinct.pluck(:title)
    current + finished
  end
end


