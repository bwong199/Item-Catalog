require 'rails_helper'
RSpec.describe 'creating an item' do
	before do 
		@user = create_user
		log_in @user
		@category = @user.categories.create(name: "New Category")
		@item = Item.create(user: @user, category: @category, name: "New Item")
	end 

	it 'edit item page for item field' do
		visit "/items/#{@item.id}/edit"
		expect(page).to have_field('Edit Item')
		fill_in "Edit Item", with: "Edited Item"
		click_button 'Edit'
		expect(current_path).to eq("/categories")
		expect(page).to have_link('Edited Item')
	end
end