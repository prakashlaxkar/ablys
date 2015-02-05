class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  # def facebook
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])

  #   if @user.persisted?
  #     sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end
  def facebook
    @user = User.find_for_oauth(request.env["omniauth.auth"], request.env["omniauth.auth"].extra.raw_info, current_user)
    login_or_redirect("Facebook")
    
  end

  def google_oauth2
    @user = User.find_for_oauth(request.env["omniauth.auth"], request.env["omniauth.auth"].info, current_user)
    login_or_redirect("Google")
  end  

  def linkedin
    @user = User.find_for_oauth(request.env["omniauth.auth"], request.env["omniauth.auth"].info, current_user)
    login_or_redirect("Linkedin")
  end 

  private
    def login_or_redirect(provider)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => provider
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
