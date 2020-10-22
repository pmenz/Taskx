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
    params.inspect
    redirect "/users/#{@user.id}"
  end

  get '/users/:id' do
    "test"
  end

end
