require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in? 
      redirect "/users/#{current_user.id}"
    else 
    erb :index
  end
end

  helpers do 
  
    def logged_in? 
      !!session[:user_id]
    end
  
    def current_user 
      User.find_by(id: session[:user_id])
    end 
    
    def authorized?(contact)
      contact.user == current_user
    end 
    
    def redirect_if_not_logged_in 
      if !logged_in? 
        flash[:message] = "please log in first"
        redirect "/"
      end
    end
    
    def find_contact 
    @contact = current_user.contacts.find(params[:id])
  end 
    
  end 
end
  
  
