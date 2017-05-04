class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  before_action :set_locale

  def set_locale
    puts params[:locale]
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private
  def current_user
    begin
      @current_user ||= Systemuser.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = Systemuser.find(session[:user_id])
    unless current_user == @user
      redirect_to login_path, :alert => "Access denied."
    end
  end

  def authenticate_user!
    if !current_user
      redirect_to login_path, :alert => 'You need to sign in for access to this page.'
    end
  end
end
