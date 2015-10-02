class Admin::PoliticalPartiesController < PoliticalPartiesController
  # layout "admin"
  before_action :set_political_party, only: [:show, :edit, :update, :destroy, :set_points, :update_policy_points]

  def new
    @political_party = PoliticalParty.new
  end

  def create
    @political_party = PoliticalParty.new(political_party_params)
    if @political_party.save
      @political_party.check_policy_point
      flash[:notice] = "新規政党を作成しました。政党ポイントを設定しましょう。"
      redirect_to :action => :set_points, :id => @political_party.id
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
    if @political_party.save
      @political_party.check_policy_point
      redirect_to :action => :set_points, :id => @political_party.id
    else
      render :edit
    end
  end

  def update_policy_points
    params[:political_party][:policy_points].each do |policy_point_params|
      policy_point = PolicyPoint.find(policy_point_params[:id])
      policy_point.attributes = {:point => policy_point_params[:point]}
      policy_point.save
    end
    flash[:notice] = "ポイントを保存しました！"
    redirect_to action: :index
  end

  def destroy
    @political_party.destroy
    redirect_to :action => :index
  end

  def set_points
    @political_party.check_policy_point
    @policy_points = @political_party.policy_points
  end

  private
  def political_party_params
    params.require(:political_party).permit(:name, :detail)
  end

  def set_political_party
    @political_party = PoliticalParty.find(params[:id])
  end
end
