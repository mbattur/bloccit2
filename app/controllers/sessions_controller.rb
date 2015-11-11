class SessionsController < ApplicationController
  def new
  end
 
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #searching user by their email address. downcase is used to make the format 
    #uniform and stored in the database this way.
    
    if user && user.authenticate(params[:session][:password])
      create_session user
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combination'
      render :new
    end
    #verifying that user is not nil and password in the params matches the specified password
    #if the user is nil the conditional statement will exit
    #if the user is authenticated the create_session will be called
  end
 
  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
  #logging out the user by calling destroy_session(current_user)
end