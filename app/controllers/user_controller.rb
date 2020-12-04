class UserController < ApplicationController
  
  get '/login'
    erb :'users/login'
  end
  
  get '/signup'
    erb :'users/signup'
  end
  
end