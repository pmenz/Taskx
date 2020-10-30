class TasksController < ApplicationController

#CRUD

  #CREATE/NEW
  get '/tasks/create' do
    erb :'/tasks/create'
  end

  post '/tasks/create' do
    #params[:description]
    #params[:day]
    #@task = Task.create(
    #  description: params[:description],
    #  day:         params[:day])
    #redirect "/tasks"

    task = Task.new(params)
    if !task.description.empty? && !task.day.empty?
      task.save
    redirect "/tasks"
    else
      @create_error = "Please enter missing information"
      erb :'/tasks/create'
    end

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

    #UPDATE

      #Edit
      #make a get request to '/tasks/:id/edit'
      #Update


    #DESTROY


end
