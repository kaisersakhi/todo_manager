class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in
  def ensure_user_logged_in
    redirect_to '/' unless current_user
  end

  def current_user
    # memoization
    return @current_user if @current_user

    current_user_id = session[:current_user_id]
    return unless current_user_id

    @current_user = User.find(current_user_id)
  end
end
