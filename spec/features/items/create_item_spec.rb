require 'rails_helper'
RSpec.describe 'creating an item' do
	before do 
		@user = create_user
		log_in @user
		@category = @user.categories.create(name: "New Category")
		# @item = Item.create(user: @user, category: @category, name: "New Item")
	end 
	it 'creating a new item redirect to categories page' do
		visit category_path(@category)
		fill_in "New Item", with: "New Item"
		expect(page).to have_button('Create Item')
		click_button 'Create Item'
		expect(current_path).to eq("/categories")
		expect(page).to have_link('New Item')
	end
end