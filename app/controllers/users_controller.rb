class UsersController < ApplicationController
  self.skip_before_action(:verify_authenticity_token)
  def show
    render plain: "fdf"#User.all#.each {|user| user.name}.join('\n')
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]

    user = User.create!(
      name: name,
      email: email,
      password: password
    )

    response_text = user ? "True" : "False"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    users = User.where("email = ?", email)
    response_text = "False"
    if users.size == 1 && users[0].password == password.strip
      response_text = "True"
    end
    render plain: response_text
  end
end
