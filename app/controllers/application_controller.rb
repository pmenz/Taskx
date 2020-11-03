require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do
    erb :'/welcome'
  end

  post '/tasks/48/delete' do
   "Hello World"
  end

  helpers do
    def current_user
      return nil unless logged_in?
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end
  end

end
