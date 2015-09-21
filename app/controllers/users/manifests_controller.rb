class Users::ManifestsController < ManifestsController

	def index
		@manifest = PublicManifest.order(:title, :content)
	end

	def new
		@manifest = Manifest.new
	end

	def create
		@manifest = Manifest.new(manifest_params)
		if @manifest.save
			flash.notice = "マニフェストが登録されました!"
			redirect_to :root
		else
			render action: 'new'
		end
	end

	def show #showページから投票できるようにする
		@public_manifest = PublicManifest.find(params[:id])
		@vote = Vote.new(public_manifest_id: @public_manifest.id)

		# @manifest = PublicManifest.find(params[:id])
		# @vote = Vote.new(manifest_id: @manifest.id)
	end

	def vote 
		@vote = Vote.new(params[:vote])
		if @vote.save
			flash.notice = "投票が完了しました。" 
			redirect_to :users_manifests
		else
			render action 'show'
		end
	end

	private
	def manifest_params
		params.require(:manifest).permit(
			:title, :content, :start_date, :end_date
		)		
	end
end
