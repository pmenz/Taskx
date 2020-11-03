class TasksController < ApplicationController

  #CREATE/NEW

  get '/tasks' do
    @user = current_user
    if !logged_in?
      redirect to '/'
    end

    @tasks = @user.tasks
binding.pry
    erb :'/tasks/new'
  end

  get '/tasks/new' do
binding.pry
    @user = current_user
    if !logged_in?
      redirect to '/'
    end
    erb :'/tasks/new'
  end

  post '/tasks/new' do
#    binding.pry
    @user = current_user
    if !(params[:description]).empty?
      @task = Task.create(
      description: params[:description],
      due:         params[:due],
      status:      params[:status],
      :user_id => @user.id
      )
#binding.pry
      @task = Task.all
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
