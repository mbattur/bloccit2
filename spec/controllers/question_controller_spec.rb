require 'rails_helper'
include RandomData

RSpec.describe QuestionController, type: :controller do
  let (:my_ques) do
    Question.create (
      id: 1,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      boolean: 
      )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_ques] to @question" do
      get :index
      expect(assigns(:question)).to eq([my_ques])
    end
  end
  
end