class ManifestsController < ApplicationController
	
	def index # マニフェスト一覧表示
		@public_manifest = PublicManifest.order(:title, :content)
	end

end
