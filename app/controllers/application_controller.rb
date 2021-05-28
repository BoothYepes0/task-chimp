# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :email, :password)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username, :email, :password, :current_password)}
          end
  def after_sign_up_path_for(resource)
    tasks_path
  end

  def after_sign_in_path_for(resource)
    tasks_path
  end

end
