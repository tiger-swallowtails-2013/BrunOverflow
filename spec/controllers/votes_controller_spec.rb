require 'spec_helper'


describe VotesController  do
  context "POST #create" do
    let(:vote) { FactoryGirl.build(:vote) }

    it "should create a vote" do
      expect {
        post :create, {
          :vote => FactoryGirl.attributes_for(:vote)
        }
      }.to change { Vote.count }.by 1
    end
  end
end


