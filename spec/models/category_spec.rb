require 'rails_helper'

RSpec.describe Category, type: :model do
	it 'requires name' do 
		category = Category.new
		category.valid?
		expect(category.errors[:name].any?).to eq(true)
	end 
	describe 'relationships' do 
		it 'belongs to a user' do 
			user = create_user
			category = user.categories.create(name: "category 1")
			expect(category.user).to eq(user)
		end 
		it 'has many items' do 
			user = create_user
			category1 = user.categories.create(name: 'category 1')
			category2 = user.categories.create(name: 'category 2')
			item1 = Item.create(name: "item 1", category: category1, user: user)
			item2 = Item.create(name: "item 2", category: category2, user: user)
			expect(category1.items).to include(item1)
			expect(category2.items).to include(item2)
		end 
	end 
end
