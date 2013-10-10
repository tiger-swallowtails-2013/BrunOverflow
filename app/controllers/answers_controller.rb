class AnswersController < ApplicationController
  before_filter :authenticate

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    @answer.save

    redirect_to @answer.question
  end
end