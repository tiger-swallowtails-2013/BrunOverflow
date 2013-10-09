require 'spec_helper'

feature "Create answer" do
  let(:new_answer) {FactoryGirl.build(:answer)}

  before do
    visit question_path(FactoryGirl.build(:question))
  end

  # after Answer.destroy_all?

  # scenario "submitting the form without body does not add an answer to the question" do
  # expect {
  #   fill_in 'Body', with: nil
  # }.to change(Answer, :count).by(1)

  scenario "submitting the form adds an answer to the question" do
    expect {
      # new_answer
      fill_in 'Body', with: new_answer.body
    }.to change(Answer, :count).by(1)

  end


end