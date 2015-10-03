class Users::ManifestsController < ManifestsController
	layout "users"

	def index
		@public_manifests = PublicManifest.all.reverse
		@user_id = 1
	end

	def new
		@manifest = Manifest.new
	end

	def create
		@manifest = Manifest.new(manifest_params)
		if @manifest.save
			flash.notice = "マニフェストが登録されました!"
			redirect_to :users_manifests
		else
			render action: 'new'
		end
	end

	def show
		@public_manifest = PublicManifest.find(params[:id])
		@vote = Vote.new
	end

	def vote
		@vote = Vote.new(vote_params)
		@user_id = @vote['user_id']
		@public_manifest_id = @vote['public_manifest_id']
		Vote.where(user_id: @user_id, public_manifest_id: @public_manifest_id).delete_all
			if @vote.save
				flash.notice = "投票が完了しました。" 
				redirect_to :users_manifests
			else
				render action 'show'
			end
	end

	def vote_info
		@votes = Vote.where("user_id = 1") #暫定的にuser_idを1としている
	end

	def vote_info_delete
		@votes = Vote.find(params[:id])
		@votes.delete
		redirect_to :users_manifests
	end

	private
	def manifest_params
		params.require(:manifest).permit(
			:title, :content, :start_date, :end_date
		)
	end
	def vote_params
		params.require(:vote).permit(
			:user_id, :public_manifest_id, :point, :comment
			)
	end
end