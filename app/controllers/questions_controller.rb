class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end
  def index
    @questions = Question.order('created_at DESC')
  end

  def show
    begin
      @question = Question.find(params[:id])
    rescue
      redirect_to :status => 404
    end
  end

  def edit
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

  def update
    begin
      @question = Question.find(params[:id])
      @question.update_attributes(params[:question])
      redirect_to @question
    rescue
      redirect_to :status => 404
    end
  end

end