class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passages, only: %i[show update result gist]
  before_action :set_user, only: %i[result]

  def show
  end

  def result
  end

  def update
    if params[:answer_ids].nil?
      redirect_to test_passage_path, notice: "Выберите ответ!" 
    else  
      @test_passage.accept!(params[:answer_ids]) 
      if @test_passage.completed?
        BadgeUserService.new(@test_passage).call
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else 
        render :show
      end
    end    
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call

    flash_options = if result.success?
      current_user.gists.create(
        question: @test_passage.current_question,
        gistid: result.response.id,
        url: result.response.html_url)
        
      { notice: t('.success', url: (helpers.link_to 'Gist', result.response.html_url, target: '_blank')) }
    else
      { alert: t('.failure') }
    end  

    redirect_to @test_passage, flash_options
  end  

  private

  def set_test_passages
    @test_passage = TestPassage.find(params[:id])
  end

  def set_user
    current_user
  end
  
end
