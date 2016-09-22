require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
	before do
		@user = create_user
		@category = @user.categories.create(name: "New category")
	end
	describe "when not logged in" do
		before do
			session[:user_id] = nil
		end
		it "cannot access index" do
			get :index
			expect(response).to redirect_to('/users/sign_in')
		end
		it "cannot access create" do
			post :create
			expect(response).to redirect_to('/users/sign_in')
		end
		it "cannot access destroy" do
			delete :destroy, id: @category
			expect(response).to redirect_to('/users/sign_in')
		end
		it "cannot update item" do
			post :update, id: @category, item: {name: "Newer name"}
			expect(response).to redirect_to('/users/sign_in')
		end
	end
	describe "when logged in as the wrong user" do
		before do
			@wrong_user = create_user 'julius@lakers.com', 'password', 'password'
			session[:user_id] = @wrong_user.id
			@category2 = @wrong_user.categories.create(name: 'Wrong user"s category')
		end
		it "cannot edit other user's post" do
			post :edit, id: @category
			expect(response).to redirect_to("/users/sign_in")
		end
		it "cannot access destroy" do
			delete :destroy, id: @category, user_id: @user
			expect(response).to redirect_to("/users/sign_in")
		end
	end
end
