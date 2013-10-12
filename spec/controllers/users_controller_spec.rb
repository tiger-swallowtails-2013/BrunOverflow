require 'spec_helper'

describe UsersController do
  describe 'POST #create' do
    it "Should create a new user" do
      expect {
        post :create, {
          user: {
            email: 'mad@max.com',
            password: 'apples'

          }
        }
      }.to change { User.count }.by 1
    end
  end
end