class Client::UsersController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    response = Unirest.post("http://localhost:3000/api/users", parameters: {
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    })  
    if response.code == 201
      redirect_to "/"
    else
      redirect_to "/client/signup"
    end
  end
end
