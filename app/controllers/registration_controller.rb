class RegistrationController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/") }
  
  configure do
    enable :sessions
    set :session_secret, "secret"
  end
  
  get '/registrations/signup' do

    erb :'/registrations/signup'
  end

  post '/registrations' do
   # if params[:name] == "" || params[:email] == "" || params[:password] == ""
   #   flash[:notice] = "<h3 class ='alert'>Please fill in info!</h3>"
   #   redirect_to '/registrations'
   #   
   # else
   #   if @user
   #     flash[:notice] = "<h3>User already exists.</h3>"
   #     redirect_to '/registrations'
   #   else
   #     @user = User.create!(:name => params[:name], :email => params[:email], :password => params[:password])
   #     session[:user_id] = @user.id
   #     redirect '/users/home'
   #   end
   # end
    
    @user = User.create!(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id

    redirect '/users/home'
  end

  get '/sessions/login' do

    erb :'sessions/login'
  end

  post '/sessions' do
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/users/home'
    end
    redirect '/sessions/login'
  end

  get '/sessions/logout' do
    session.clear
    redirect '/'
  end

  get '/users/home' do

    @user = User.find_by_id(session[:user_id])
    erb :'/users/home'
  end
  
end