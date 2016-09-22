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
  end
end