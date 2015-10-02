class Admin::CategoriesController < ManifestsController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash.notice = '登録完了'
			redirect_to :admin_categories
		else
			render action 'new'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy!
		flash.notice = '消去完了'
		redirect_to :admin_categories
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category = Category.assign_attributes(category_params)
		if @category.save
			flash.notice = '更新完了'
			redirect_to :admin_categories
		else
			reder action 'edit'
		end
	end



	private
	def category_params
		params.require(:category).permit(
			:content, :name
		)
	end

end

