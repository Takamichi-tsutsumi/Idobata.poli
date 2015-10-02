class Admin::QuestionsController < QuestionsController
  # layout "admin"
  before_action :set_question, only: [:show, :edit, :destroy, :update]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.valid?
      @question.save
      @question.init_policy_points
      redirect_to action: :show, id: @question.id
    else
      render :new
    end
  end

  def edit
  end

  def update
    @question.attributes = question_params
    if @question.valid?
      @question.save
      redirect_to action: :show, id: @question.id
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to action: :index
  end


  private
  def question_params
    params.require(:question).permit(:content, :note)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
