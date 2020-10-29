class UsersController < ApplicationController

#signup

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

 #Login

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if (!@user.nil? && (@user.password == params[:password]))
      redirect "/users/#{@user.id}"
    else
      @login_error = "Please enter correct credentials"
      erb :"/welcome"
    end
  end

#show tasks

  get '/users/:id' do
    erb :"users/show"
  end

end
