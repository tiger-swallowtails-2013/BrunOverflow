require 'spec_helper'

describe AnswersController do
  describe "GET answer#new" do
    it "should have a new route" do
      get :new
      expect(assigns(:answer)).to be_a(Answer)
    end
  end

  describe "POST answer#create" do
    let (:new_answer) {FactoryGirl.build(:answer)}

    it "should create a new answer" do
      post :create, answer: {body: new_answer.body}
      expect(assigns(:answer)).to be_a(Answer)
    end

    it "should redirect back to original question" do

    end

  end
end