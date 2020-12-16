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
  
  get '/patients/new' do
    if logged_in?
      patients
      erb :'patients/create'
    else
      redirect to '/login'
    end
  end

  post '/patients' do
    if logged_in?
      if params[:content] == ""
        redirect to "/patients/new"
      else
        @vaccine = current_user.vaccine.build(name: params[:name], disease: params[:disease], time: params[:time])
        if @vaccine.save
          redirect to "/patients/#{@vaccine.id}"
        else
          redirect to "/patients/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/patients/:id' do
    if logged_in?
      @vaccine = Patient.find_by_id(params[:id])
      erb :'patients/show'
    else
      redirect to '/login'
    end
  end

  get '/patients/:id/edit' do
    if logged_in?
      patients
      @vaccine = Patient.find_by_id(params[:id])
      if @vaccine && @vaccine.user_id == current_user.id
        erb :'patients/edit'
      else
        redirect to '/patients'
      end
    else
      redirect to '/login'
    end
  end

  patch '/patients/:id' do
    if logged_in?
      if params[:content] == ""
        redirect to "/patients/#{params[:id]}/edit"
      else
        @vaccine = Patient.find_by_id(params[:id])
        if @vaccine && @vaccine.user_id == current_user.id
          if @vaccine.update(name: params[:name], disease: params[:disease], time: params[:time])
            redirect to "/patients/#{@vaccine.id}"
          else
            redirect to "/patients/#{@vaccine.id}/edit"
          end
        else
          redirect to '/patients'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/patients/:id/delete' do
    if logged_in?
      @vaccine = Patient.find_by_id(params[:id])
      if @vaccine && @vaccine.user == current_user
        @vaccine.delete
      end
      redirect to '/patients'
    else
      redirect to '/login'
    end
  end
end