class SessionsController < ApplicationController

  def index
    render layout: 'loginLayout'
  end

  def login
    authorized_user = ::Systemuser.authenticate(params[:email], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to root_path, notice: 'Você está logado'
    else
      redirect_to login_path, notice: 'Usuario ou senha incorretos'
    end
  end

  def destroy
    reset_session
    redirect_to login_url, :notice => 'Signed out!'
  end
end