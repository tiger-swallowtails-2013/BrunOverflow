class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    @answer.save

    render :json => render_to_string(:partial => 'new_answer', :locals => {:answer => @answer.body}).to_json
  end
end