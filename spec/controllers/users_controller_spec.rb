require 'spec_helper'

describe UsersController do
  describe 'POST #create' do
    it "Should create a new user" do
      expect {
        post :create, {
          user: {
            name: 'madMax',
            password: 'apples',
            email: "max@gmail.com"
          }
        }
      }.to change { User.count }.by 1
    end
  end
end
