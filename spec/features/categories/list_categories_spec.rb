require 'rails_helper'
RSpec.describe 'user profile page' do
  before do
    @user = create_user
    log_in @user
    @category1 = @user.categories.create(name: 'Category 1')
    @category2 = @user.categories.create(name: 'Category 2')
  end
  it "displays everyone's categories" do
    visit '/categories'
    expect(page).to have_text(@category1.name)
    expect(page).to have_text(@category2.name)
  end
end