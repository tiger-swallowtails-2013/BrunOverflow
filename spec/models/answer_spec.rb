require 'spec_helper'

describe Answer do
  it { should validate_presence_of(:body) }
  it "has a valid FactoryGirl factory" do
    expect(FactoryGirl.build(:answer)).to be_valid
  end
end