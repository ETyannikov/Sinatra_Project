class PatientController < ApplicationController
  
  get '/patient'
  erb :'patient/index'
  end
end