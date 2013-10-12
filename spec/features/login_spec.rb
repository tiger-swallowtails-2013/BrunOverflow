require 'spec_helper'

feature 'User try to login' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'User fill login form with valid data' do
    visit root_path
    click_on 'Sign In'
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Login'
    expect(current_path).to eq(root_path)
    expect(page).to have_content "Welcome #{user.email}"
  end
end