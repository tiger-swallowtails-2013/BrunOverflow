require 'spec_helper'

describe SessionsController do
  before(:each) do
    @valid_attributes = {name: "dave", password: "1234"}
    @user = User.create(@valid_attributes)
  end
  it "creates a new session at login" do
    post :create, @valid_attributes
    expect(assigns(:user)).to eq(@user)
  end
end