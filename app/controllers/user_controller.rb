class UserController < ApplicationController
  
  
  
  get '/login' do
    erb :'users/login'
  end
  
  
  
  get '/signup' do
    erb :'users/signup'
  end
  
  
  
  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
        redirect to 'vaccines' 
    else
      redirect to 'login'
    end
  end
  
  
  
  
  post '/signup' do
    @message=""
    #create User object
    @user = User.new(:username => params[:username], :password => params[:password])
    #input validation before saving
    if User.find_by(:username => params[:username]) == "" || params[:username] == "" || params[:password] == ""
      @message = "Invalid information, please try again"
      redirect to '/signup'
    else
      @user.save
      session[:user_id] = @user.id
      redirect to 'vaccines'
    end #if
  end #post signup
  
  
  
  

  
  
  
  get '/signout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end #if logged_in
  end #signout
  
end #Usercontroller