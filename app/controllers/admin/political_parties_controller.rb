class Admin::PoliticalPartiesController < PoliticalPartiesController
  # layout "admin"
  before_action :set_political_party, only: [:show, :edit, :update, :destroy]

  def new
    @political_party = PoliticalParty.new
  end

  def create
    @political_party = PoliticalParty.new(political_party_params)
    if @political_party.valid?
      @political_party.save
      # flash[success] = '政党を登録しました。'
      redirect_to :action => :index
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    @political_party.attributes = political_party_params
    if @political_party.valid?
      @political_party.save
      # flash[success] = '情報を更新しました。'
      redirect_to :action => :index
    else
      render :edit
    end
  end

  def destroy
    @political_party.destroy
    redirect_to :action => :index
  end

  private
  def political_party_params
    params.require(:political_party).permit(:name, :detail)
  end

  def set_political_party
    @political_party = PoliticalParty.find(params[:id])
  end
end
