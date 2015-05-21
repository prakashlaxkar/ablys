class Users::SessionsController < Devise::SessionsController

  def create
    unless params[:user][:login].blank?
      user = User.where("email = ? OR username = ?", params[:user][:login], params[:user][:login]).first
      if user
        resource = warden.authenticate(:scope => resource_name, :recall => 'sessions#failure')
        if resource
          sign_in_and_redirect(resource_name, resource)
        else
          @error_message = "Invalid username and password"
          render :action => :failure
        end
      else
        @error_message = user.blank? ? "You dont have valid account. Please sign in." : "You have to confirm your account before continuing."
        render :action => :failure
      end
    else
      @error_message = "Please enter your username id and password."
      render :action => :failure
    end
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    respond_to do |format|
      format.js
    end
  end

  def failure   
    respond_to do |format|
      format.js
    end
  end
end
