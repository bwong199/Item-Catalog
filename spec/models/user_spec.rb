require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'relationships' do 
		it 'has many categories' do 
			user = create_user
			category1 = user.categories.create(name: 'category 1')
			category2 = user.categories.create(name: 'category 2')
			expect(user.categories).to include(category1)
			expect(user.categories).to include(category2)
		end 
		it 'has many items' do 
			user = create_user
			category1 = user.categories.create(name: 'category 1')
			category2 = user.categories.create(name: 'category 2')
			item1 = Item.create(name: "item 1", category: category1, user: user)
			item2 = Item.create(name: "item 2", category: category2, user: user)
			expect(user.items).to include(item1)
			expect(user.items).to include(item2)
		end 
	end 
end
