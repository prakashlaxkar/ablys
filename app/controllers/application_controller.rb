class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :email, :dob, :f_name, :gender, :avatar, :gotra, :address, :city, :state, :phone, :pin_code, :marital_status, :is_matrimony, :qualification, :designation, :company_name, :income)
  end
end
