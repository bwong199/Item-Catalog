require 'rails_helper'
RSpec.describe 'creating a user' do
  before do
    visit 'users/sign_up'
  end
  it 'creates new user and redirects to profile page with proper credentials' do
    fill_in 'Email', with: 'kobe@lakers.com'
    fill_in 'Password', with:  'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(current_path).to eq("/")
  end
  it 'shows validation errors without proper credentials' do
    click_button 'Sign up'
    expect(current_path).to eq('/users')
    expect(page).to have_text("Email can't be blank")
    expect(page).to have_text("Password can't be blank")
  end
end