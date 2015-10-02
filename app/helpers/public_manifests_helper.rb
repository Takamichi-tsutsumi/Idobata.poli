module PublicManifestsHelper

	def show_category_info(number)
		return Category.find(number)['name']
	end

	def show_manifest_relation(number)
		return @manifest_relaitons =  Manifest.where("id = #{number}").pluck("title, content")
	end

	def number_of_vote(number)
		return @votes = Vote.where("public_manifest_id = #{number}").pluck(:point)
	end
end
