class TestPassagesController < ApplicationController

  before_action :set_test_passages, only: %i[show update result]
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
        redirect_to result_test_passage_path(@test_passage)
      else 
        render :show
      end
    end    
  end

  private

  def set_test_passages
    @test_passage = TestPassage.find(params[:id])
  end

  def set_user
    current_user
  end
  
end
