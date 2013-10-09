class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def create
    Question.create(params[:question])
    redirect_to root_path
  end

  def destroy
    Question.destroy(params[:id])
    redirect_to root_path
  end
end