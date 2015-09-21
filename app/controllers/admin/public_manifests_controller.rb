class Admin::PublicManifestsController < ApplicationController

	def index
		@public_manifest = PublicManifest.order(:title, :content)
	end

	def new
		@public_manifest = PublicManifest.new
	end

	def show
		@public_manifest = PublicManifest.find(params[:id])
	end

	def edit
		@public_manifest = PublicManifest.find(params[:id])
	end

	def create
		@public_manifest = PublicManifest.new(public_manifest_params)
		if @public_manifest.save
			manifests_id.each do |manifest_id| #manifests_idとはview/admin/manifest/indexでcheck_box_tagメソッドで複数選択できるようにして、そのidを"hoge"に格納する
				@manifest_relation = ManifestRelation.create(manifest_id: manifest_id, public_manifest_id: @public_manifest.id ) 
			end
			hoge.each do |manifest_id| #hogeとはview/admin/indexでcheck_box_tagメソッドで複数選択できるようにして、そのidを"hoge"に格納する
				@manifest_relation = ManifestRelation.create(manifest_id: manifest_id, public_manifest_id: @public_manifest.id ) 
			flash.notice = "登録完了"
			redirect_to :admin_root
		else
			render action  'new'
		end
	end

	def update
		@public_manifest = PublicManifest.find(params[:id])
		@public_manifest.assign_attributes(public_manifest_params)
		if @public_manifest.save
			flash.notice = "更新完了"
			redirect_to [ :admin, :manifests]
		else
			render action  'edit'
		end
	end


	def destroy
		@public_manifest = PublicManifest.find(params[:id])
		@public_manifest.destroy!
		flash.notice = '消去完了'
		redirect_to :admin_root
	end

	private
	def public_manifest_params
		params.require(:public_manifest).permit(
			:title, :content, :start_date, :end_date
		)
	end
end
