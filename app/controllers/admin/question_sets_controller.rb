class Admin::QuestionSetsController < QuestionSetsController
  layout "admin"
  before_action :set_model, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_admin!

  def index
    @question_sets = QuestionSet.all
  end

  def show
  end

  def new
    @question_set = QuestionSet.new
    @questions = Question.all
  end

  def create
    @question_set = QuestionSet.new(question_set_params)
    if @question_set.save
      flash.notice = "success!!"
      redirect_to action: :index
    else
      @questions = Question.all
      render :new
    end
  end

  def edit
    @questions = Question.all
  end

  def update
    @question_set.attributes = question_set_params
    if @question_set.save
      flash.notice = "success!!"
      redirect_to action: :index
    else
      @questions = Question.all
      render :edit
    end
  end

  def destroy
    @question_set.destroy
    flash.notice = "success!!"
    redirect_to action: :index
  end


  private
  def question_set_params
    params.require(:question_set).permit!
  end

  def set_model
    @question_set = QuestionSet.find(params[:id])
  end
end
