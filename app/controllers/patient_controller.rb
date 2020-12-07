class PatientController < ApplicationController
  
  get '/patient' do
    erb :'patient/index'
  end
end