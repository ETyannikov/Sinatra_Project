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
    #define type of user, true if doctor, false if patient
    if params[:type] == "doctor"
      type = true
    else
      type = false
    end
    
    #create User object
    @user = User.new(:username => params[:username], :password_digest => params[:password], :full_name => params[:fullname], :is_doctor => type)
    
    #input validation before saving
    if User.find_by(:username => params[:username]) == "" || params[:username_digest] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user.save
      session[:user_id] = @user.id
    end #if
    
    #redirects to doctor index or patient edit depending on type
    if type 
      redirect to '/doctor/index' 
    else
      redirect to '/patient/edit'
    end

  end #post signup
  
end #Usercontroller