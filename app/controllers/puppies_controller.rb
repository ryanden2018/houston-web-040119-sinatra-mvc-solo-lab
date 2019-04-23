class PuppiesController < ApplicationController
   
  get '/puppy' do
    @all_puppies = Puppy.get_all_puppies
    erb :'/puppy/index'
  end
  
  get '/puppy/new' do
    erb :'/puppy/new'
  end

  get '/puppy/:id' do
    @id = params[:id].to_i
    @puppy = Puppy.get_puppy_by_id(@id)
    erb :'/puppy/show'
  end

  get '/puppy/:id/edit' do
    @id = params[:id].to_i
    @puppy = Puppy.get_puppy_by_id(@id)
    erb :'/puppy/edit'
  end

  post '/puppy' do
    @puppy_name = params[:name]
    @puppy_breed = params[:breed]
    @id = Puppy.new_puppy(@puppy_name, @puppy_breed)
    redirect "/puppy/#{@id}"
  end

  delete '/puppy/:id' do
    Puppy.remove_puppy_by_id(params[:id].to_i)
    redirect '/puppy'
  end

  patch '/puppy/:id' do
    @id = params[:id].to_i
    @new_name = params[:name]
    @new_breed = params[:breed]
    Puppy.update_puppy_by_id(@id,{:name => @new_name, :breed => @new_breed})
    redirect "/puppy/#{@id}"
  end

end