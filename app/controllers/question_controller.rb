class QuestionController < ApplicationController
  def resources
  end
  
  def index
    @question = Question.all
  end
end
