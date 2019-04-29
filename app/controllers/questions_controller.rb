class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy]
  before_action :set_test, only: %i[create index]

  #rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @questions = @test.questions
  endquestions

  def new    
    
  end

  def create
    @question = @test.questions.create(question_params)
    
    render plain: "Вопрос создан"
  end

  def show    
    
  end

  def destroy
    @question.destroy

    redirect_to :root
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

  def rescue_with_test_not_found
    render plain: 'Question not found'
  end
  
end
