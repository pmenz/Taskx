class UsersController < ApplicationController

#CREATE

  get '/users/signup' do
    if logged_in?
      redirect to '/users/:id'
    end
    erb :"/users/signup"
  end

  post '/users/signup' do
    @user = User.create(params)
    if
     (!@user.username.empty?) && (!@user.password.empty?)
     session[:user_id] = @user.id
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

#READ

  get '/welcome' do
    if logged_in?
      redirect to '/users/:id'
    else
      erb :"/welcome"
    end
  end

  post '/welcome' do
     @user = User.find_by(username: params[:username])
     if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
     else
      @login_error = @user
      erb :"/welcome"
     end
  end

  get '/users/:id' do
    if logged_in?
      @user = current_user
      erb :"users/show"
    end
  end

#CREATE
  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    else
      redirect to '/'
    end
  end

end
