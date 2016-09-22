require 'rails_helper'
RSpec.describe 'logging in' do
  before do
    @user = create_user
  end
  it 'prompts for email and password' do
    visit '/users/sign_in'
    expect(page).to have_field('Email')
    expect(page).to have_field('Password')
  end
  it 'logs in user if email/password combination is valid' do
    log_in @user
    expect(current_path).to eq("/")
    expect(page).to have_text("Signed in successfully.")
  end
  it 'does not sign in user if email/password combination is invalid' do
    log_in @user, 'wrong password'
    expect(page).to have_text('Invalid Email or password.')
  end
end