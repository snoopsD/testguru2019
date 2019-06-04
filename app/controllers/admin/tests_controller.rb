class Admin::TestsController < Admin::BaseController
  
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update destroy start update_inline]
  
  def index
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

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private 

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all
  end  

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :creator_id, :timer)
  end  
end
