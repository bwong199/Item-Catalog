require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	before do
		@user = create_user
		@category = @user.categories.create(name: 'Oops')
		@item = Item.create(user: @user, category: @category, name: "New Item")
	end
	describe "when not logged in" do
		before do
			session[:user_id] = nil
		end
		it "cannot create item" do
			post :create
			expect(response).to redirect_to('/users/sign_in')
		end

		it "cannot delete item" do
			post :destroy, id: @item
			expect(response).to redirect_to('/users/sign_in')
		end

		it "cannot update item" do
			post :update, id: @item, item: {name: "Newer name"}
			expect(response).to redirect_to('/users/sign_in')
		end
	end

	describe "when logged in as the wrong user" do
		before do
			@wrong_user = create_user 'julius@lakers.com', 'password', 'password'
			session[:user_id] = @wrong_user.id
			@category2 = @user.categories.create(name: 'Wrong user"s category')
		end
		it "cannot edit other user's post" do
			post :edit, id: @item
			expect(response).to redirect_to("/users/sign_in")
		end
		it "cannot access destroy" do
			delete :destroy, id: @item
			expect(response).to redirect_to("/users/sign_in")
		end
	end
end
