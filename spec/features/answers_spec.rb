require 'spec_helper'

feature "answers" do
  let(:new_answer) {FactoryGirl.build(:answer)}
  let(:answered_question) {FactoryGirl.create(:question_with_answers)}

  scenario "submitting the form adds an answer to the question" do
    visit question_path(FactoryGirl.create(:question))
    expect {
      fill_in 'answer_body', with: new_answer.body
      click_button "create new comment"
    }.to change(Answer, :count).by(1)
  end

  scenario "associated answers should be displayed on question page" do
    visit question_path(answered_question)
    expect(page).to have_content(answered_question.answers.last.body)
  end

end
