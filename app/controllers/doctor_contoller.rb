class DoctorController < ApplicationController
  
  get '/doctor/index' do
    if logged_in?
      @patients = []
        Patient.all.each do |patient|
          if patient.doctor && patient.doctor.id == session[:user_id] then @patients << patient end
        end #each do
      erb :'doctor/index'
    else 
      redirect to '/login'
    end #if
  end #'/doctor/index'
  
  
  
end #DoctorController