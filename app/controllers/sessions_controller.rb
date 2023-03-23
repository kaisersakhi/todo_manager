class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def new
    if current_user
      redirect_to todos_path
    else
      render 'new'
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to '/'
    else
      # either email is incorrect or password is wrong
      flash[:error] = 'Invalid Email or Password, retry!'
      redirect_to sign_in_path
    end
  end

  def sign_out
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to new_sign_in_path
  end
end
