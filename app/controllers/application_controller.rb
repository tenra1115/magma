class ApplicationController < ActionController::Base
  before_action :user_signup, if: :devise_controller?
  protected

  def user_signup
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end


end
