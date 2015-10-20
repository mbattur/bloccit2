class QuestionsController < ApplicationController
  def resources
  end
  
  def index
    @questions = Question.all
  end
end
