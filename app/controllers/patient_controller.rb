class PatientController < ApplicationController
  
  get '/patient' do
    current_user
    erb :'patients/index'
  end
end