class PatientController < ApplicationController
  
    get '/patients' do
    #if logged_in?
      current_user
      @patients = []
        Patient.all.each do |patient|
          @patients << patient
        end #each do
      erb :'patients/index'
    #else 
      #redirect to '/login'
    #end #if
  end #'/doctor/index'
end