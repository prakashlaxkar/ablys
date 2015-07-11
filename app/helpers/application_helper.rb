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
    routes = ['/', "/users/sign_up", "/contact_us", "/users/sign_in", "/events"]
    routes.include? request.path
  end
end
