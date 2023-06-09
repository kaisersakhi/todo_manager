class UsersController < ApplicationController
  # skip_before_action(:verify_authenticity_token)
  skip_before_action :ensure_user_logged_in

  def index
    render plain: User.all.each(&:to_s).join("\n")
  end

  # @return [Object]
  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]

    new_user = User.new(
      first_name:,
      last_name:,
      email:,
      password:
    )

    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to todos_path
    else
      flash[:error] = new_user.errors.full_messages.join(', ')
      redirect_to new_user_path
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    users = User.where('email = ?', email)
    response_text = 'False'
    response_text = 'True' if users.size == 1 && users[0].password == password.strip
    render plain: response_text
  end

  def new
    if current_user
      redirect_to todos_path
    else
      render 'new'
    end
  end
end
