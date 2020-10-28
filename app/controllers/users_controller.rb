class UsersController < ApplicationController

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
    #params[:username]
    #parans[:password]
    @user = User.create(
      username: params[:username],
      password: params[:password])
    redirect "/users/#{@user.id}"
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if (!@user.nil? && (@user.password == params[:password]))
      redirect "/users/#{@user.id}"
    else
      @login_error = "Please enter correct credentials"
      erb :"/welcome"
    end
  end

  get '/users/:id' do
    "test #{params[:id]}"
  end

end
