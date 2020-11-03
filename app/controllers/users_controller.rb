class UsersController < ApplicationController

#CREATE

  get "/users/signup" do
    if logged_in?
      redirect to "/users/show"
    end
    erb :'/users/signup'
  end

  post "/users/signup" do
    if (params[:username]).empty? && (params[:password]).empty?
      @signup_error = "Something went wrong! please try again"
      erb :'/users/signup'
    elsif !(User.find_by(username: params[:username]) == nil)
      @signup_error = "Username already exist, please try again"
      erb :'/users/signup'
    else
      @user = User.create(
      username: params[:username],
      password: params[:password]
    )
      session[:user_id] = @user.id
      @task = Task.all
      erb :"/users/show"
    end
  end

  get "/users/:id" do
    @user = current_user
    @tasks = current_user.tasks
#    binding.pry
#    if logged_in?
#     @user = User.find_by(params[:username])
    erb :'users/show'
#    end
  end
#READ

  get "/welcome" do
    if logged_in?
      redirect to "/users/#{current_user.id}"
    else
      erb :'/welcome'
    end
  end

  post "/welcome" do
     @user = User.find_by(username: params[:username])
     if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      @task = Task.all
      erb :"/users/show"
     else
      @login_error = "Something went wrong! please try again"
      erb :'/welcome'
     end
  end

#CREATE
  get "/logout" do
    if logged_in?
      session.clear
      redirect to "/"
    else
      redirect to "/"
    end

  end
end
