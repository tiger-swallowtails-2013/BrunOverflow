require 'spec_helper'

feature 'Signup' do
  scenario 'guest enters valid form information is redirected to home page' do
    visit new_user_path
      fill_in 'user_name', with: Faker::Internet.user_name
      fill_in 'user_password', with: Faker::Internet.password

      click_on 'Sign Up'

      expect(current_path).to eq root_path


  end

end