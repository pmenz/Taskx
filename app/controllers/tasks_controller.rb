class TasksController < ApplicationController

#CRUD

  #CREATE

    #New
    #Makes a get reques to '/tasks/new'

    #Create
    #Make a post request to '/tasks'


  #READ

    #Index
    #make a get reuest to '/tasks'
    get '/tasks' do
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
