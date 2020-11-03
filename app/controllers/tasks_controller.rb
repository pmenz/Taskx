class TasksController < ApplicationController

#CREATE/NEW
  get '/tasks/new' do
    @user = current_user
    if !logged_in?
      redirect to '/'
    end
    erb :'/tasks/new'
  end

  post '/tasks/new' do
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

#UPDATE
    patch '/tasks/:id' do
      @task = current_user.tasks.find(params[:id])
      @task.update(
        description: params[:description],
        due:         params[:due]
      )
      redirect to "/users/#{current_user.id}"
    end

    get '/tasks/:id/edit' do
      @task = current_user.tasks.find(params[:id])
      erb :'tasks/edit'
    end

#DESTROY
    get '/tasks/:id/delete' do
      @user = current_user
      redirect '/tasks/:id/delete'
    end

    delete '/tasks/:id/delete' do
      binding.pry
      task = current_user.tasks.find(params[:id])
      task.destroy
      erb :'/users/show'
    end


end
