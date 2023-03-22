class UsersController < ApplicationController
  # skip_before_action(:verify_authenticity_token)
  def index
    render plain: User.all.each {|user| user.name.to_s}.join("\n")
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]

    user = User.create!(
      first_name:,
      last_name:,
      email:,
      password:
    )

    redirect_to '/'
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
    render 'new'
  end
end
