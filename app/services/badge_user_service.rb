class BadgeUserService
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end 

  def call
    Badge.all.each do |badge|
      case badge.rule
      when 'first_try_complete'
        give_badge(badge) if first_try_successfull?           
      when 'level_complete'
        give_badge(badge) if level_complete?(badge.value.to_i)
      when 'category_complete'
        give_badge(badge) if category_complete?(badge.value)
      end  
    end
  end

  private

  def give_badge(badge)
    @user.badges << badge
  end  

  def successfull_test?
    @test_passage.successfully?
  end

  def first_try_successfull?
    successfull_test? && @user.tests.where(id: @test.id).count == 1
  end  

  def level_complete?(level)
    tests_ids = Test.levels_test(level).ids
    complete_tests_ids = @user.tests.levels_test(level).distinct.ids

    successfull_test? && (complete_tests_ids == tests_ids)    
  end

  def category_complete?(category)
    tests_ids = Test.categories_test(category).ids
    complete_tests_ids = @user.tests.categories_test(category).distinct.ids

    successfull_test? && (complete_tests_ids == tests_ids)
  end

end
