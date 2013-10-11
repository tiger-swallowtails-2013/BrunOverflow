require 'spec_helper'

describe Answer do
  it { should validate_presence_of(:body) }
  it { should have_many(:votes) }

  it "has a valid FactoryGirl factory" do
    expect(FactoryGirl.build(:answer)).to be_valid
  end

  it { should belong_to(:question)}
  it { should belong_to(:user)}
end
