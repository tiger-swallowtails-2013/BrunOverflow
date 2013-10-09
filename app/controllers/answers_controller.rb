class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    @answer.save
    # eventually redirect to the original question?
    redirect_to @answer
  end
end