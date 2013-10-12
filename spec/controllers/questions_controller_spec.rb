require 'spec_helper'

describe QuestionsController do
  let(:question) { FactoryGirl.create(:question) }

  describe "POST #create" do
    it "creates a new question with title and content" do
      expect {
        post :create, {
          question:  FactoryGirl.attributes_for(:question)
        }
      }.to change { Question.count }.by 1
      expect(response).to redirect_to question_path(Question.last)
    end

    it "creating question with no title renders edit page again" do
      expect {
        invalid_question_attributes = FactoryGirl.attributes_for(:question)
        invalid_question_attributes.delete(:title)
        post :create, {
          question:  invalid_question_attributes
        }
      }.not_to change { Question.count }
      expect(current_path).to render_template :edit
    end
  end

  describe "GET #index" do
    it "returns all questions ordered by create date DESC" do
      questions = 3.times.map { FactoryGirl.create(:question) }
      get :index
      expect(assigns(:questions)).to eq(questions.reverse)
    end
  end

  describe "DELETE #destroy" do
    it "should delete a question with the id passed from the DB" do
      question
      expect {
        delete :destroy, { id: question.id }
      }.to change {Question.count}.by -1
    end

    it "redirects to 404 when an inexistent id is passed" do
      delete :destroy, { id: 0 }
      expect(response.status).to eq 404
    end
  end

  describe "GET #show" do
    it "should assign the question with the id passed to a variable" do
      question
      get :show, { id: question.id }
      expect(assigns(:question)).not_to be_nil
    end

    it "redirects to 404 when an inexistent id is passed" do
      get :show, { id: 0 }
      expect(response.status).to eq 404
    end
  end

  describe "PUT #update" do
    it "should update the question with the parameters passed" do
      put :update, {
        id: question,
        question: {
          title: "Updated Title",
          content: "Updated Content"
        }
      }
      question.reload
      expect(question.title).to eq("Updated Title")
      expect(question.content).to eq("Updated Content")
    end

    it "allows only one attribute to be updated" do
      put :update, {
        id: question,
        question: {
          title: 'new title'
        }
      }
      question.reload
      expect(question.title).to eq('new title')
      expect(question.content).to eq(question.content)
    end

    it "redirects to 404 when an inexistent id is passed" do
      put :update, {
        id: 0,
        question: {
          title: '123',
          content: '321'
        }
      }
      expect(response.status).to eq 404
    end
  end

  describe "GET #edit" do
    it "loads question for edit mode" do
      get :edit, { id: question }
      expect(assigns(:question)).not_to be_nil
    end
  end

end