require 'rails_helper'

RSpec.describe Item, type: :model do
	describe 'relationships' do 
		it 'belongs to a user' do 
			user = create_user
			category = user.categories.create(name: "category 1")
			item = category.items.create(name: "item 1", user: user, category: category)
			expect(item.user).to eq(user)
		end 
	end 
end
