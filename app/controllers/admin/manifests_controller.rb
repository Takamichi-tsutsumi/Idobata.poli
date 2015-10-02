class Admin::ManifestsController < ManifestsController

	def index
		@manifests = Manifest.all
	end

	def show
		@manifest = Manifest.find(params[:id])
		@manifest_relations = ManifestRelation.where("manifest_id = #{params[:id]}").pluck("public_manifest_id")

	end

	def destroy
		@manifest = Manifest.find(params[:id])
		@manifest.destroy!
		flash.notice = '消去完了'
		redirect_to :admin_manifests
	end
end

