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
      user.is_doctor ? redirect '/doctor/index' : redirect '/patient/index'
    else
      redirect to 'login'
    end
  end
  
  post '/signup' do
    #define type of user, true if doctor, false if patient
    if params[:type] == "doctor"
      type = true
    else
      type = false
    end
    
    #create User object
    @user = User.new(:username => params[:username], :password => params[:password], :full_name => params[:fullname], :is_doctor => type)
    
    #input validation before saving
    if User.find_by(:username => params[:username]) != nil || params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user.save
      session[:user_id] = @user.id
    end #if
    
    #redirects to doctor index or patient edit depending on type
    type ? redirect '/doctor/index' : redirect '/patient/edit'

  end #post signup
  
end #Usercontroller