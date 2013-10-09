class QuestionsController < ApplicationController
  def index
    @questions = Question.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    Question.create(params[:question])
    redirect_to root_path
  end

  def destroy
    begin
      Question.destroy(params[:id])
      redirect_to root_path
    rescue
      redirect_to :status => 404
    end
  end
end