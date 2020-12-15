require './config/environment.rb'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if logged_in?
      erb '/user/index'
    else
      redirect to '/login'
    end
  end
  
  helpers do
  
  def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def patients
      @patients = []
        Patient.all.each do |patient|
          @patients << patient
        end #each do
    end
  end

end