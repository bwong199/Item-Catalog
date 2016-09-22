require 'rails_helper'
RSpec.describe 'creating a new category' do
	before do 
		user = create_user
		log_in user
		click_link 'Create Category'
		expect(current_path).to eq("/categories/new")
	end 

	it 'provides form to create a new category' do
		visit '/categories/new'
		expect(page).to have_field('New Category')
	end
end