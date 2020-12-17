class VaccineController < ApplicationController
  
  get '/vaccines' do
    if logged_in?
      info
      @vaccines = Vaccine.all
      erb :'vaccines/index'
    else
      redirect to '/login'
    end
  end

get '/vaccines/new' do
    if logged_in?
      info
      erb :'vaccines/create'
    else
      redirect to '/login'
    end
  end

  post '/vaccines' do
    if logged_in?
      if params[:name] == ""
        redirect to "/vaccines/new"
      else
        @vaccine = current_user.vaccine.build(name: params[:name], disease: params[:disease], time: params[:time])
        if @vaccine.save
          redirect to "/vaccines/#{@vaccine.id}"
        else
          redirect to "/vaccines/new"
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/vaccines/:id' do
    if logged_in?
      info
      @vaccine = Vaccine.find_by_id(params[:id])
      @user = User.find_by_id(@vaccine.user_id)
      erb :'vaccines/show'
    else
      redirect to '/login'
    end
  end

  get '/vaccines/:id/edit' do
    if logged_in?
      info
      @vaccine = Vaccine.find_by_id(params[:id])
      if @vaccine && @vaccine.user_id == current_user.id
        erb :'vaccines/edit'
      else
        redirect to '/vaccines'
      end
    else
      redirect to '/login'
    end
  end

  patch '/vaccines/:id' do
    if logged_in?
      if params[:name] == ""
        redirect to "/vaccines/#{params[:id]}/edit"
      else
        @vaccine = Vaccine.find_by_id(params[:id])
        if @vaccine && @vaccine.user_id == current_user.id
          if @vaccine.update(name: params[:name], disease: params[:disease], time: params[:time])
            redirect to "/vaccines/#{@vaccine.id}"
          else
            redirect to "/vaccines/#{@vaccine.id}/edit"
          end
        else
          redirect to '/vaccines'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/vaccines/:id/delete' do
    if logged_in?
      @vaccine = Vaccine.find_by_id(params[:id])
      if @vaccine && @vaccine.user_id == current_user.id
        @vaccine.delete
      end
      redirect to '/vaccines'
    else
      redirect to '/login'
    end
  end
  
end

