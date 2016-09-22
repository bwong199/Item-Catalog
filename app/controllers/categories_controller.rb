class CategoriesController < ApplicationController
	before_action :authenticate_user!, only: [:index, :create, :destroy, :edit, :update]
	before_action :require_correct_user, only: [ :destroy, :edit]
	def index
		@categories = Category.all
		respond_to do |format|
		   format.html # show.html.erb
		   format.json { render json: @categories.to_json(:include => [:items])}
		 end
	end 

	def new 
		@category = Category.new
	end 


	def create
		@category = current_user.categories.build(category_params)
		if @category.valid?
			@category.save
			redirect_to categories_path
		else 
			flash[:errors] = "Error saving category"
			redirect_to new_category_path
		end
	end

	def edit
		@category = Category.find(params[:id])
	end 

	def update
		@category = Category.find(params[:id])
		@category.update_attributes(category_params)
		redirect_to categories_path
	end 

	def show
		@item = Item.new
		@category = Category.find(params[:id])
	end 

	def destroy
		category = Category.find(params[:id])
		category.destroy if category.user = current_user
		redirect_to categories_path
	end
	private 

	def category_params
		params.require(:category).permit(:name)
	end 

	def require_correct_user
		category = Category.find(params[:id])
		redirect_to categories_path if current_user != category.user
	end
end
