require './config/environment.rb'

class ApplcationController < ActiveRecord::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end
  
  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user])
    end

    def logged_in?
      current_user != nil
    end
  end
end