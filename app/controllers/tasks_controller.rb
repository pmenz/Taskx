class TasksController < ApplicationController

#CREATE/NEW
  get '/tasks/new' do
    @user = current_user
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
    delete '/tasks/:id/delete' do
      @task = current_user.tasks.find(params[:id])
      @task.destroy
      redirect '/users/show'
    end
end
