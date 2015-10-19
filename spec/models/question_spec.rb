require 'rails_helper'

RSpec.describe Question, type: :model do
  let (:question) {Question.create! }
  
  describe "attributes" do
      it "should respond to title" do
          expect(question).to respond_to(:title)
      end
      
      it "should respond to body" do
          expect(question).to respond_to(:body)
      end
      
      it "should respond to boolean" do
          expect(question).to respond_to(:boolean)
      end
  end
end
