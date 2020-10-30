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
    if !tasks.description.empty? && !tasks.day.empty?
      task.save
    redirect "/tasks/#{@task.id}"
    else
      @create_error = "Please enter missing information"
      erb :'/tasks/new'
    end

  end


    #New
    #Makes a get reques to '/tasks/new'

    #Create
    #Make a post request to '/tasks'

    get '/tasks/:id' do
      @task = current_user.tasks.find_by(id: params[:id])
      erb :'tasks/new'
    end
  #READ

    #Index
    #make a get reuest to '/tasks'
    get '/tasks' do
      @tasks = current_user.tasks
      erb :'tasks/index'
    end
    #Show

    #UPDATE

      #Edit
      #make a get request to '/tasks/:id/edit'
      #Update


    #DESTROY


    helpers do
      def current_user
        User.first
      end
    end

end
