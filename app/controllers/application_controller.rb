class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_user, :get_movie_count #:check_user_token

  def set_current_user
    @current_user = { :id => 1, email: "indro.de@gmail.com", username: "zenpunch" }
  end

  def get_movie_count
    @movie_count = Movie.count
  end

  def check_user_token
    [ENV["SHINEMA_BETA_USER1"], ENV["SHINEMA_BETA_USER2"], ENV["SHINEMA_BETA_USER3"]].include?(session["shinema_user_token"])
  end
end
