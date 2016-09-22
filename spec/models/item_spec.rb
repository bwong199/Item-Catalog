require 'rails_helper'

RSpec.describe Item, type: :model do
	it 'requires name' do 
		item = Item.new
		item.valid?
		expect(item.errors[:name].any?).to eq(true)
	end 
end
describe 'relationships' do 
	it 'belongs to a user' do 
		user = create_user
		category = user.categories.create(name: "category 1")
		item = category.items.create(name: "item 1", category: category, user: user)
		expect(item.user).to eq(user)
	end
	it 'belongs to a category' do 
		user = create_user
		category = user.categories.create(name: "category 1")
		item = category.items.create(name: "item 1", category: category, user: user)
		expect(item.category).to eq(category)
	end
end 
