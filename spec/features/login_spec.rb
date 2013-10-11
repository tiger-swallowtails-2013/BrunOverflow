require 'spec_helper'

feature 'User try to login' do
  let(:user) { FactoryGirl.create(:user) }

  scenario 'User fill login form with valid data' do
    visit login_path
    fill_in 'name', with: user.name
    fill_in 'password', with: user.password
    click_on 'Login'
    expect(current_path).to eq(root_path)
  end
end