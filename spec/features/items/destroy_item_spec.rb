require 'rails_helper'
RSpec.describe 'destroying item' do
  before do
    @user = create_user
    log_in @user
    @category1 = @user.categories.create(name: 'Category 1')
    @item1 = Item.create(name: "Item 1", user: @user, category: @category1)
  end


  it "deleting an item redirects user to home category page" do 
    visit '/categories'
    expect(page).to have_button("Delete Item")
    click_button 'Delete Item'
    expect(current_path).to eq("/categories")
    expect(page).not_to have_text('Item 1')
  end 
end