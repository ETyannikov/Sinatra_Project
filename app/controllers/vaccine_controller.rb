class VaccineController < ApplicationController
  
  get '/vaccines' do
    if logged_in?
      @vaccines = Vaccine.all
      erb :'vaccines/index'
    else
      redirect to '/login'
    end
  end

get '/vaccines/new' do
    if logged_in?
      patients
      erb :'vaccines/create'
    else
      redirect to '/login'
    end
  end

  post '/vaccines' do
    if logged_in?
      if params[:content] == ""
        redirect to "/vaccines/new"
      else
        @vaccine = current_user.vaccines.build(content: params[:content])
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
      @vaccine = Vaccine.find_by_id(params[:id])
      erb :'vaccines/show'
    else
      redirect to '/login'
    end
  end

  get '/vaccines/:id/edit' do
    if logged_in?
      @vaccine = Vaccine.find_by_id(params[:id])
      if @vaccine && @vaccine.user == current_user
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
      if params[:content] == ""
        redirect to "/vaccines/#{params[:id]}/edit"
      else
        @vaccine = Vaccine.find_by_id(params[:id])
        if @vaccine && @vaccine.user == current_user
          if @vaccine.update(content: params[:content])
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
      if @vaccine && @vaccine.user == current_user
        @vaccine.delete
      end
      redirect to '/vaccines'
    else
      redirect to '/login'
    end
  end
  
end

