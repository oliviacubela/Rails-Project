class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
end

#wrote the current_user method with find_by_id because it doesnt error out, rather returns null if doesnt exist
#use the 'or equals' bc it will only call the database once 
#if you use the current_user method more than once in a method (learned this in sinatra)