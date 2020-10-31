class UsersController < ApplicationController

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users/signup' do
    @user = User.create(params)
    if
     (!@user.username.empty?) && (!@user.password.empty?)
      redirect "/users/#{@user.id}"
    elseif
      User.find_by(username: params[:@user.username]).exist?
      @signup_error = "Username already exist, please try again"
      erb :"users/signup"
    else
      @signup_error = "Please enter correct credentials"
      erb :"users/signup"
    end
  end

  post '/users/login' do
    @user = User.find_by(username: params[:username])
    if (!@user.nil? && (@user.password == params[:password]))
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @login_error = "Please enter correct credentials"
      erb :"/welcome"
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :"users/show"
  end

  post '/logout' do
    sessions.clear
    redirect '/'
  end
end
