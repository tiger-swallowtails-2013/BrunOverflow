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
      expect(response).to redirect_to root_path
    end
  end

  describe "GET #index" do
    it "sets a variable with all the questions in the DB" do
      3.times { FactoryGirl.create(:question) }
      get :index
      expect(assigns(:questions).count).to eq(3)
    end

    it "returns all questions ordered by create date DESC" do
      3.times { FactoryGirl.create(:question) }
      question
      get :index
      expect(assigns(:questions).first).to eq(question)
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