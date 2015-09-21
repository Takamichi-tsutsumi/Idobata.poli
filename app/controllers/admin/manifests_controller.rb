class Admin::ManifestsController < ManifestsController

	def index
		@manifest = Manifest.order(:created_at)
	end

	def show
		@manifest = Manifest.find(params[:id])
	end

	def destroy
		@manifest = Manifest.find(parama[:id])
		@manifest.destroy!
		flash.notice = '消去完了'
		redirect_to :admin_root
	end
end

