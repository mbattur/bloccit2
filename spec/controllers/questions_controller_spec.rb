require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do
  
  let (:my_ques) do
    Question.create! (
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      resolved:false
      )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_ques] to @question" do
      get :index
      expect(assigns(:questions)).to eq([my_ques])
    end
  end
end