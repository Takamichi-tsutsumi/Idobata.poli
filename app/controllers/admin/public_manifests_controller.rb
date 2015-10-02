class Admin::PublicManifestsController < ApplicationController

	def index
		@public_manifests = PublicManifest.all.reverse
		@search_form = PublicManifest.new
	end

	def new
		@public_manifest = PublicManifest.new
		@categories = Category.pluck("name, id")
	end

	def show
		@public_manifest = PublicManifest.find(params[:id])
		@manifest_relations = ManifestRelation.where(public_manifest_id: params[:id]).pluck("manifest_id")
	end

	def edit
		@public_manifest = PublicManifest.find(params[:id])
	end

  def create
    @public_manifest = PublicManifest.new(public_manifest_params)
    if @public_manifest.save 
      if Manifest.all.any?
        flash.notice = "どのマニフェストを元にこのpublicmanifestを作成しましたか？"
        redirect_to :action => "manifests_relation_edit", :id => @public_manifest.id
      else 
        redirect_to :action => :index
      end
    else
      render action  'new'
		end
	end

	def manifests_relation_update
		ManifestRelation.where(public_manifest_id: params[:id]).delete_all
		@public_manifest_id = PublicManifest.find(params[:id])
		@relations = params[:relations]
		@relations.each do |relation|
			@manifest_relation = ManifestRelation.create(:manifest_id => relation, :public_manifest_id => @public_manifest_id['id'])
		end
		if @manifest_relation.save
			flash.notice = 'マニフェストの登録関連付けが完了しました。'
			redirect_to :admin_public_manifests
		else
			render action 'manifests_relation_edit'
		end
	end

	def manifests_relation_edit
		@manifests_relation = ManifestRelation.new
		@manifests = Manifest.all
		@id = params[:id]
	end


	def update
		@public_manifest = PublicManifest.find(params[:id])
		@public_manifest.assign_attributes(public_manifest_params)
		if @public_manifest.save
			flash.notice = "更新完了"
			redirect_to [ :admin, :public_manifests]
		else
			render action  'edit'
		end
	end


	def destroy
		@public_manifest = PublicManifest.find(params[:id])
		@public_manifest.destroy!
		flash.notice = '消去完了'
		redirect_to :admin_public_manifests
	end

	def search
		@search_words = [params[:public_manifest][:content], params[:public_manifest][:title]]
		@search_results_title = PublicManifest.where("title like ?",  "%" + "#{@search_words[0]}" + "%" ).where("title like ?",  "%" + "#{@search_words[1]}" + "%" )
		@search_results_content = PublicManifest.where("content like ?",  "%" + "#{@search_words[0]}" + "%" ).where("content like ?",  "%" + "#{@search_words[1]}" + "%" )
		@search_results_title_content = PublicManifest.where("title like ?",  "%" + "#{@search_words[0]}" + "%" ).where("content like ?",  "%" + "#{@search_words[1]}" + "%" )
		@search_results_content_title = PublicManifest.where("title like ?",  "%" + "#{@search_words[1]}" + "%" ).where("content like ?",  "%" + "#{@search_words[0]}" + "%" )
		@search_all = @search_results_content + @search_results_title + @search_results_title_content + @search_results_content_title
		@search_final_result = @search_all.uniq
		@search_results_count = @search_final_result.count
	end

	def sort
		if params[:type] == "category"
			@public_manifests = PublicManifest.all.sort_by{ |item| item['category_id'] }
			@sort_name = 'カテゴリー順'
		else
			@total_point_of_public_manifests = []
			PublicManifest.all.each do |public_manifest|
				@points_of_public_manifests = Vote.where(public_manifest_id: public_manifest[:id]).pluck("point")
				@total_point_of_public_manifest = 0
				@points_of_public_manifests.each do |point_of_public_manifest|
					@total_point_of_public_manifest += point_of_public_manifest
				end
				@total_point_of_public_manifests.push({"title" => public_manifest['title'], "public_manifest_id" => public_manifest['id'], "category_id" => public_manifest['category_id'], "point" => @total_point_of_public_manifest})
			end
			if params[:type] == "descending_vote" #voteの降順
				@sort_name = '投票数（降順）'
				@public_manifests = @total_point_of_public_manifests.sort_by{ |item| item['point']}.reverse
			elsif params[:type] == "ascending_vote" #voteの昇順
				@sort_name = '投票数（昇順）'
				@public_manifests = @total_point_of_public_manifests.sort_by{ |item| item['point']}
			end
		end
	end




	private
	def public_manifest_params
		params.require(:public_manifest).permit(
			:category_id, :title, :content, :start_date, :end_date
		)
	end
end

