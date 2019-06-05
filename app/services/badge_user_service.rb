class BadgeUserService
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end 

  def call
    if successfull_test?
      first_try_successfull
      level_complete
      category_complete
    end
  end

  private

  def give_badge(badge) 
    @user.badges << badge
  end  

  def successfull_test?
    @test_passage.successfully?
  end

  def first_try_successfull
    @user.tests.where(id: @test.id).count == 1
    give_badge(BadgeRule.where(rule: 'first_try_complete').first.badge)
  end  

  def level_complete
    level = BadgeRule.where(rule: 'level_complete').first.value
    tests_ids = Test.levels_test(level).ids
    complete_tests_ids = @user.tests.levels_test(level).distinct.ids

    if complete_tests_ids == tests_ids  
      give_badge(BadgeRule.where(rule: 'level_complete').first.badge) 
    end  
  end

  def category_complete
    category = BadgeRule.where(rule: 'category_complete').first.value

    tests_ids = Test.categories_test(category).ids
    complete_tests_ids = @user.tests.categories_test(category).distinct.ids

    if complete_tests_ids == tests_ids
      give_badge(BadgeRule.where(rule: 'category_complete').first.badge)
    end
  end

end
