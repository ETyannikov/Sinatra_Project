class UserController < ApplicationController
  
  
  
  get '/login' do
    erb :'users/login'
  end
  
  
  
  get '/signup' do
    erb :'users/signup'
  end
  
  
  
  post '/login' do
    user = User.find_by(:username => params[:username])
    binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
        redirect to 'doctor/index' 
    else
      redirect to 'login'
    end
  end
  
  
  
  
  post '/signup' do
    @message=""
    #create User object
    @user = User.new(:username => params[:username], :password_digest => params[:password])
    #input validation before saving
    if User.find_by(:username => params[:username]) != "" || params[:username] == "" || params[:password] == ""
      @message = "Invalid information, please try again"
      redirect to '/signup'
    else
      binding.pry
      @user.save
      session[:user_id] = @user.id
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