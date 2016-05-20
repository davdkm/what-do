class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # def github
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   sign_in_and_redirect @user
  # end

  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user#, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_session_path, flash: {error: 'There was an error.'}
    end
  end

  def failure
    redirect_to root_path
  end

end
