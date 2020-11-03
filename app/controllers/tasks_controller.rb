class TasksController < ApplicationController

  #CREATE/NEW
=begin
  get '/tasks' do
    @user = current_user
    if !logged_in?
      redirect to '/'
    end
    @tasks = @user.tasks
    erb :'/tasks/new'
  end
=end

  get '/tasks/new' do
#binding.pry
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
      @task = current_user.tasks.create(
        description: params[:description],
        due:         params[:due],
        status:      params[:status]
      )
      @tasks = current_user.tasks
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
      @tasks = current_user.tasks
      erb :'tasks/index'
    end
    #Show

    patch '/tasks/:id' do
      @task = current_user.tasks.find(params[:id])
      @task.update(
        description: params[:description],
        due:         params[:due]
      )
      redirect to "/users/#{current_user.id}"
    end
#UPDATE
    get '/tasks/:id/edit' do
      @task = current_user.tasks.find(params[:id])
      erb :'tasks/edit'
    end

      #Edit
      #make a get request to '/tasks/:id/edit'
      #Update


    #DESTROY



end
