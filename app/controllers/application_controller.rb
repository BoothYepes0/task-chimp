# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action(:load_current_user )
  
  # Uncomment this if you want to force user s to sign in before any other actions
  # before_action(:force_user _sign_in)
  
  def load_current_user 
    the_id = session[:user _id]
    @current_user  = User .where({ :id => the_id }).first
  end
  
  def force_user _sign_in
    if @current_user  == nil
      redirect_to("/user _sign_in", { :notice => "You have to sign in first." })
    end
  end

end
