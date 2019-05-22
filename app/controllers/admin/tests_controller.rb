class Admin::TestsController < Admin::BaseController
  
  before_action :set_test, only: %i[show edit update destroy start]
  
  def index
    @tests = Test.all
  end

  def show    
  end
  
  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    @test.creator = current_user

    if @test.save
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    @test.creator = current_user
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  private 

  def set_test
    @test = Test.find(params[:id])
  end
  
  def set_creator
  
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id)
  end  
end
