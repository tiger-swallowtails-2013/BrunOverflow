require 'spec_helper'

describe SessionsController do
  let!(:user) { FactoryGirl.create(:user)}
  describe "POST #create" do
    it "should create a set the session to the user id on login" do
      post :create, {email: user.email, password: user.password}
      expect(session[:user_id]).to eq(user.id)
      expect(response).to redirect_to(root_path)
    end
  end
end