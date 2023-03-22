class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      p user
    else
      # either email is incorrect or password is wrong
      puts 'wrong email or password'
    end
  end
end
