class UsersController < ApplicationController
  
  get "/signup" do 
    erb :"users/signup"
  end 
  
  post "/signup" do 
  if params[:username] == "" || params[:password] == ""
      redirect '/signup'
    else
      User.create(params)
      redirect '/login'
    end
  end
  
  get "/login" do 
    erb :"users/login"
  end
  
  post "/login" do 
    user = User.find_by(:username => params[:username])
  
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id 
        redirect "/show"
    else 
        redirect "/login" 
    end
  end

end 