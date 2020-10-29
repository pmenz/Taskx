class TasksController < ApplicationController

#CRUD

  #CREATE/NEW
  get '/tasks/create' do
    erb :'/tasks/create'
  end

  post '/tasks/create' do
    #params[:description]
    #params[:day]
    @task = Task.create(
      description: params[:description],
      day:         params[:day])
    redirect "/tasks"
  end


    #New
    #Makes a get reques to '/tasks/new'

    #Create
    #Make a post request to '/tasks'


  #READ

    #Index
    #make a get reuest to '/tasks'
    get '/tasks' do
      @tasks = Task.all
      erb :'tasks/index'
    end
    #Show
    #make aget request to 'recipes/:id'


    #UPDATE

      #Edit
      #make a get request to '/tasks/:id/edit'
      #Update


    #DESTROY


end
