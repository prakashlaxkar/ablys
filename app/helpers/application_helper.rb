module ApplicationHelper
	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
	  devise_mapping.to
	end

  def three_pannel
    if params[:controller] == "events"
      params[:action] == 'galary' ? (return false) : (return true)
    else
      routes = ['/', "/users/sign_up", "/contact_us", "/users/sign_in"]
      routes.include? request.path
    end
  end
end
