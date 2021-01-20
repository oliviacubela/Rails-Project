class SessionsController < ApplicationController 
  def welcome 
  end

  def destroy 
    session.delete(:user_id)
    redirect_to '/'
  end

  def new 
  end

  def create 
    @user = User.find_by(username: params[:user][:username])
    if @user.try(:authenticate, params[:user][:password])
    # if @user && @user.authenticate(password: params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Login incorrect - please try again."
      redirect_to login_path
    end
  end

  #below method - we're setting up a do block and this allows us to find stuff off of email attribute, but able to set other attributes
  #gives us more flexibility... its doing the same thing as User.find_or_create_by[:email]and other attributes, etc.
  def omniauth 
 
    @user = User.find_or_create_by(username: auth[:info][:email]) do |u|   #username instead of email bc we want to avoid different people creating same usernames and potentially logging in to other person's acct, so we set the username to be the email...thought this was avoided w/ uniqueness validation????
      u.password = SecureRandom.hex 
    end

    session[:user_id] = @user.id
    #if you havent set the password, it wont assign a userid, which means we won't have a user here to deal with
    redirect_to user_path(@user)

    #User.where(email: auth[:info][:email]).first_or_initialize
    #both .where method and .find_or_create_by method accomplish same thing
    
  end

  private

  def auth 
    request.env['omniauth.auth']
  end
end