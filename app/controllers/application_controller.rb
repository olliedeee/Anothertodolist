class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
    flash[:danger] = "Sorry, you are not authorised to access that area"
  end
end
