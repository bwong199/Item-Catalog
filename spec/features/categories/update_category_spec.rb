require 'rails_helper'
RSpec.describe 'updating a blog' do
  before do
    @user = create_user
    log_in @user
    @category = @user.categories.create(name: "My Category")
  end
  
  it 'updating a category and redirect to home category page' do
    visit "/categories/#{@category.id}/edit"
    expect(page).to have_field('Edit Category')
    fill_in 'Edit Category', with: 'My New Category'
    click_button 'Edit'
    expect(current_path).to eq("/categories")
    expect(page).not_to have_text('My Category')
  end
end