require 'spec_helper'

describe "guest can create a question" do
  let(:question) { FactoryGirl.create(:question) }

  describe "index page" do
    it "displays a new question link" do
      visit root_path
      page.should have_selector('a', text: "Ask a Question")
    end

    it "clicking on Ask a Question link goes to questions#new" do
      spec_helper_login
      visit root_path
      click_link 'Ask a Question'
      expect(current_path).to eq(new_question_path)
    end

    it "goes to question #show page when user clicks on a question on the list and shows its content" do
      question
      visit root_path
      click_link question.title
      expect(current_path).to eq(question_path(question))
      page.should have_content question.content
    end

    it "should display a login link so the user can sign up" do
      visit root_path
      click_link "Sign Up"
      fill_in "user_name", with: "bob"
      fill_in "user_password", with: "password"
      click_on 'Sign Up'
      expect(current_path).to eq(root_path)
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
