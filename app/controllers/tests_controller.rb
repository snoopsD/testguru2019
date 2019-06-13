class TestsController < ApplicationController
  
  before_action :authenticate_user!, except: %i[index]
  before_action :set_test, only: %i[start]
  
  def index
    @tests = Test.all
  end

  def start
    passage = TestPassage.new(user: current_user, test: @test)
    passage.set_timer! 
   
   redirect_to current_user.test_passage(@test)
  end

  private 

  def set_test
    @test = Test.find(params[:id])
  end
  
end
