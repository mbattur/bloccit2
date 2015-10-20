require 'rails_helper'

RSpec.describe Question, type: :model do
  let (:question) {Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  
  describe "attributes" do
      it "should respond to title" do
          expect(question).to respond_to(:title)
      end
      
      it "should respond to body" do
          expect(question).to respond_to(:body)
      end
      
      it "should respond to resolved" do
          expect(question).to respond_to(:resolved)
      end
  end
end
