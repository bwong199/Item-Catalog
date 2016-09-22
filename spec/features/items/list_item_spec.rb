require 'rails_helper'
RSpec.describe 'user profile page' do
  before do
    @user = create_user
    log_in @user
    @category1 = @user.categories.create(name: 'Category 1')
    @category2 = @user.categories.create(name: 'Category 2')
    @item1 = Item.create(name: "Item 1", user: @user, category: @category1)
    @item2 = Item.create(name: "Item 2", user: @user, category: @category2)
  end
  it "displays everyone's items" do
    visit '/categories'
    expect(page).to have_text(@item1.name)
    expect(page).to have_text(@item2.name)
  end

  it "have a delete button for each item" do
    visit '/categories'
    expect(page).to have_button("Delete Item", count: 2)
  end
end