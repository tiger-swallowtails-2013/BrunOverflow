require 'spec_helper'

describe QuestionsController do
  let(:question) { FactoryGirl.create(:question) }

  describe "POST #create" do
    it "creates a new question with title and content" do
      expect {
        post :create, {
          question:  FactoryGirl.attributes_for(:question)
        }
      }.to change { Question.count }.by 1
      expect(response).to redirect_to root_path
    end
  end

  describe "GET #index" do
    it "sets a variable with all the questions in the DB" do
      3.times { FactoryGirl.create(:question) }
      get :index
      expect(assigns(:questions).count).to eq(3)
    end

    it "returns all questions ordered by create date DESC" do
      3.times { FactoryGirl.create(:question) }
      question
      get :index
      expect(assigns(:questions).first).to eq(question)
    end
  end

end