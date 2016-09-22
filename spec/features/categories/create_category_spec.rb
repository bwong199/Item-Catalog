require 'rails_helper'
RSpec.describe 'creating a category' do
	before do 
		user = create_user
		log_in user
		click_link 'Create Category'
		expect(current_path).to eq("/categories/new")
	end 

	it 'creates a new category and redirects to profile page' do
		fill_in 'New Category', with: 'My Category'
		click_button 'Create Category'
		expect(current_path).to eq("/categories")
		expect(page).to have_text('My Category')
	end

	it 'displays error message if there is an error saving the category' do 
		click_button 'Create Category'
		expect(current_path).to eq("/categories/new")
		expect(page).to have_text('Error saving category')
	end 
end