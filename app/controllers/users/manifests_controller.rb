class Users::ManifestsController < ManifestsController

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

	private
	def manifest_params
		params.require(:manifest).permit(
			:title, :content, :start_date, :end_date
		)		
	end
end
