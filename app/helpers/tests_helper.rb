module TestsHelper
  TEST_LEVELS =  { 0 => 'easy', 1 => 'elementary', 2 => 'advanced', 3 => 'hard' }.freeze

  def test_level(test)
   TEST_LEVELS[test.level] || :hero
  end

  def questions_count(test)
    test.questions.count
  end   

  def format_timer(test)

    if test.timer <= 60
      "00:" "%02d" % "#{test.timer / 60}"
    else  
      test.timer * 60
       "%02d" % "#{test.timer / 60}" + ":" "%02d" % "#{test.timer % 60}"
    end
  end
end
