class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in to do that"
      redirect_to new_session_path
    end
  end
  #unless the user is current user ask them to sign_in. 
  #if the user is not current user flash an error message and redirect to sign in page
end
