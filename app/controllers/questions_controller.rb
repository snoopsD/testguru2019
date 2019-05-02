class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show destroy edit update]
  before_action :set_test, only: %i[create new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_not_found

  def new    
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def show    
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
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
