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
    puts params
  end
  
end