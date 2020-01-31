class CharacterController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/") }
  
  configure do
    enable :sessions
    set :session_secret, "secret"
  end
  
  get '/characters/create' do
    
    erb :'/characters/create'
  end
  
  post '/characters' do
    @character = Character.new(name: params["name"], subclass: params["subclass"], gender: params["gender"])
    @character.save
    session[:character_id] = @character.id
    
    redirect '/characters/list'
  end
  
  get '/characters/list' do
    
    @character = Character.find_by_id(session[:character_id])
    erb :'/characters/list'
  end
  
  get '/characters/edit' do
    
    @character = Character.find_by_id(session[:character_id])
    erb :'/characters/edit'
  end
  
  get '/characters/delete' do
    Character.delete(session[:character_id])
    redirect '/users/home'
  end
  
  
end