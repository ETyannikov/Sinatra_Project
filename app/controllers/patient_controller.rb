class PatientController < ApplicationController
  
    get '/patients' do
    #if logged_in?
      info
      erb :'patients/index'
    #else 
      #redirect to '/login'
    #end #if
  end #'/doctor/index'
  
  get '/patients/new' do
    if logged_in?
      
      info
      erb :'patients/create'
    else
      redirect to '/login'
    end
  end

  post '/patients' do
    if logged_in?
      info
      if params[:full_name] == ""
        redirect to "/patients/new"
      else
        @patient = current_user.patient.build(full_name: params[:full_name], dob: params[:dob], gender: params[:gender])
        if @patient.save
          redirect to "/patients/#{@patient.id}"
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
      info
      @patient = Patient.find_by_id(params[:id])
      erb :'patients/show'
    else
      redirect to '/login'
    end
  end

  get '/patients/:id/edit' do
    if logged_in?
      info
      @patient = Patient.find_by_id(params[:id])
      if @patient && @patient.user_id == current_user.id
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
      info
      if params[:full_name] == ""
        redirect to "/patients/#{params[:id]}/edit"
      else
        @patient = Patient.find_by_id(params[:id])
        if @patient && @patient.user_id == current_user.id
          if @patient.update(full_name: params[:full_name], dob: params[:dob], gender: params[:gender])
            redirect to "/patients/#{@patient.id}"
          else
            redirect to "/patients/#{@patient.id}/edit"
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
      info
      @patient = Patient.find_by_id(params[:id])
      if @patient && @patient.user_id == current_user.id
        @patient.delete
      end
      redirect to '/patients'
    else
      redirect to '/login'
    end
  end
end