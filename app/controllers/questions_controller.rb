class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy]
  before_action :set_test, only: %i[create index new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def index
    @questions = @test.questions
  end

  def new    
    
  end

  def create
    @question = @test.questions.create(question_params)
    
    redirect_to test_path(@test)
  end

  def show    
    
  end

  def destroy
    @test = @question.test
    @question.destroy

    redirect_to test_path(@test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end 

  def rescue_with_record_not_found
    render plain: 'Record not found'
  end
end
