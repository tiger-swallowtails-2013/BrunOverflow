require 'spec_helper'

describe "guest can create a question" do
  describe "index page" do
    it "displays a new question link" do
      visit root_path
      page.should have_selector('a', text: "Ask a Question")
    end

    it "clicking on Ask a Question link goes to questions#new" do
      visit root_path
      click_link 'Ask a Question'
      expect(current_path).to eq(new_question_path)
    end
  end

  describe "new question page" do
    it "should display the question in the homepage page after asking it" do
      new_question = FactoryGirl.build(:question)
      visit new_question_path
      fill_in 'question_title', with: new_question.title
      fill_in 'question_content', with: new_question.content
      click_on 'Submit'
      page.should have_content new_question.title
    end
  end
end
