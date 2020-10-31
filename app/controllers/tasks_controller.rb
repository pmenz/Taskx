class TasksController < ApplicationController

#CRUD
  #CREATE/NEW
  get '/tasks/new' do
    erb :'/tasks/new'
  end

  post '/tasks' do
    #params[:description]
    #params[:day]
    #@task = Task.create(
    #  description: params[:description],
    #  day:         params[:day])
    #redirect "/tasks"
    @task = current_user.tasks.new(params)
    erb :'/users/show'
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
