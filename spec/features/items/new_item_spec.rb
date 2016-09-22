require 'rails_helper'
RSpec.describe 'showing an item creation form' do
	before do 
		user = create_user
		log_in user
	end 

	it 'provides form in show category page to create a new item' do
		click_link("Create Category")
		expect(current_path).to eq("/categories/new")
		expect(page).to have_field('New Category')
	end
end