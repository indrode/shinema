class GeneralController < ApplicationController
  before_action :authenticate_user, :except => :deauthenticate

  def authenticate
    render :text => "Your token was authenticated correctly. Refresh this page to proceed."
  end

  def deauthenticate
    session[:shinema_user_token] = nil
    render :text => "Deauthenticated."
  end


  private

  def authenticate_user
    redirect_to root_path if current_user

    token = params[:token]
    if token && encrypted_token = EncryptionService.decrypt(token)
      session[:shinema_user_token] = encrypted_token
    else
      render :unauthorized, :text => "Authentication failed."
    end

  end

end
