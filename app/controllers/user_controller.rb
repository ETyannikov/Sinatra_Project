class UserController < ApplicationController
  
  
  
  get '/login' do
    erb :'users/login'
  end
  
  
  
  get '/signup' do
    erb :'users/signup'
  end
  
  
  
  post '/login' do
    user = User.find_by(:username => params[:username])
    if user # && user.authenticate(params[:password_digest])
      session[:user_id] = user.id
      if user.is_doctor 
        redirect to 'doctor/index' 
      else 
        redirect to '/index'
      end
    else
      redirect to 'login'
    end
  end
  
  
  
  
  post '/signup' do
    @message=""
    #create User object
    @user = User.new(:username => params[:username], :password_digest => params[:password], :full_name => params[:fullname])
    
    #input validation before saving
    if User.find_by(:username => params[:username]) == "" || params[:username] == "" || params[:password] == ""
      @message = "Invalid information, please try again"
      redirect to '/signup'
    else
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