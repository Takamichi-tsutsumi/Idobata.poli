module ManifestHelper

	def show_voting_history(public_manifest_id)
		return @voting_histories = PublicManifest.where("id = #{public_manifest_id}").pluck("title, content")
	end

	def show_voting_claim(user_id, public_manifest_id)
		return @claims = Vote.where(user_id: user_id, public_manifest_id: public_manifest_id).pluck("comment, point")[0]
	end

	def show_public_manifest(public_manifest_id)
		@public_manifest_info = PublicManifest.where(id: public_manifest_id).pluck("title, content")
	end
end
