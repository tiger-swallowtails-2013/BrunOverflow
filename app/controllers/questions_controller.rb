class QuestionsController < ApplicationController
  def create
    Question.create(params[:question])
    redirect_to questions_path
  end
end