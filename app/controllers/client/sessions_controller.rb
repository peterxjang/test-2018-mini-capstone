class Client::SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    response = Unirest.post(
      "http://localhost:3000/user_token",
      parameters: {
        auth: {
          email: params[:email],
          password: params[:password]
        }
      }
    )
    if response.code == 201
      jwt = response.body["jwt"]
      Unirest.default_header("Authorization", "Bearer #{jwt}")
      redirect_to "/"
    else
      redirect_to "/client/login"
    end
  end

  def destroy
    jwt = ""
    Unirest.clear_default_headers()
    redirect_to '/client/login'
  end
end
