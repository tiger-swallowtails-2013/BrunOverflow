require 'spec_helper'

describe Question do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should have_many(:answers)}
  it { should belong_to(:user)}

  it { should have_many(:votes) }

  it "should have a valid Factory Girl factory" do
    expect(FactoryGirl.build(:question)).to be_valid
  end
end
