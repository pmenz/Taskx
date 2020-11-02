class TasksController < ApplicationController

  #CREATE/NEW

  get '/tasks' do
    if !logged_in?
      redirect to '/'
    end
    erb :'/tasks/new'
  end

  get '/tasks/new' do
    if !logged_in?
      redirect to '/'
    end
    erb :'/tasks/new'
  end

  post '/tasks/new' do
    @user = current_user
    if !(params[:description]).empty?
      @task = Task.create(
      description: params[:description],
      due:         params[:due],
      status:      params[:status]
      )
#binding.pry
      erb :'/users/show'
    else
#binding.pry
      @create_error = "Description can't be empty"
      erb :'/tasks/new'
    end

  end

#READ
    get '/tasks/:id' do
      @tasks = Task.all
      erb :'users/show'
    end

    get '/tasks' do
      @tasks = Task.all
      erb :'tasks/index'
    end
    #Show

#UPDATE
    get 'tasks/:id/edit' do
      @task = Task.find(params[:id])
      erb :'tasks/new'
    end

      #Edit
      #make a get request to '/tasks/:id/edit'
      #Update


    #DESTROY



end
