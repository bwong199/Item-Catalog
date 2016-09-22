class ItemsController < ApplicationController
	before_action :authenticate_user!, only: [:index, :create, :destroy, :edit, :update]
	before_action :require_correct_user, only: [:create, :destroy, :edit, :update]

	def create
		category = Category.find(params[:category_id])
		user = User.find(params[:user_id])
		item = Item.create(user: user, category: category, name: item_params[:name])
		if item.valid?
			item.save
			redirect_to categories_path
		else 
			flash[:errors] = "Error saving item"
			redirect_to new_category_path
		end
	end 

	def edit
		@item = Item.find(params[:id])
	end 

	def update
		@item = Item.find(params[:id])
		@item.update_attributes(item_params)
		redirect_to categories_path
	end		

	def destroy
		item = Item.find(params[:id])
		item.destroy if item.user == current_user
		redirect_to categories_path
	end

	private 

	def item_params
		params.require(:item).permit(:name)
	end 

	def require_correct_user
		begin 
			category = Category.find(params[:id])
		rescue 
			category = Item.find(params[:id])
		end 
		redirect_to categories_path if current_user != category.user
	end
end
