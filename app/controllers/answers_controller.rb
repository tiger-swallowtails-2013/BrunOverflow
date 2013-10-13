class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      render :json => render_to_string(:partial => 'new_answer', :locals => {:answer => @answer.body}).to_json
    else
      render :json => @answer.errors.full_messages[0].to_json, :status => :unprocessable_entity
    end
  end
end