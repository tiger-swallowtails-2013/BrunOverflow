require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user, password: "apassword") }
  it { should validate_uniqueness_of(:email) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should have_many(:answers)}
  it { should have_many(:questions)}

  it "authenticates the user credentials" do
    expect(User.authenticate(user.email,"apassword")).to be_true
  end

end