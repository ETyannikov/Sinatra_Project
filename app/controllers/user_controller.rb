class UserController < ApplicationController
  
  get '/login' do
    erb :'users/login'
  end
  
  get '/signup' do
    erb :'users/signup'
  end
  
  post '/login' do
    
  end
  
  post '/signup' do
    if params[:type] == "doctor"
      type = true
    else
      type = false
    end
    @user = User.new(:username => params[:username], :password => params[:password], :full_name => params[:fullname], :is_doctor => type)
    
  end
  
end