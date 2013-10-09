require 'spec_helper'

describe QuestionsController do
  describe "POST #create" do
    it "creates a new question with title and content" do
      expect {
        post :create, {
          question: {
            :title => "What is life?",
            :content => "What id life anyway?"
          }
        }
      }.to change { Question.count }.by 1
    end
  end


end