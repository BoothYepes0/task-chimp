# frozen_string_literal: true

Rails.application.routes.draw do
  # Routes for the User  account:

  # SIGN UP FORM
  get("/user _sign_up", { :controller => "user _authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user ", { :controller => "user _authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user _profile", { :controller => "user _authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user ", { :controller => "user _authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user _account", { :controller => "user _authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user _sign_in", { :controller => "user _authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user _verify_credentials", { :controller => "user _authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user _sign_out", { :controller => "user _authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
