class UsersController < ApplicationController
  
  get "/signup" do 
    erb :"users/signup"
  end 
  
  post "/signup" do 
    erb :"users/signup"
  end 
  
  post "/users" do 
    @user = User.create(params)
    if params[:username] == "" && params[:password] == ""
      #create field not empty helper_method
      #flash for if not unique
      erb :"users/signup"
    else
      User.create(params)
      redirect '/login'
    end
  end
  
  get "/login" do 
    erb :"users/login"
  end
  
  post "/login" do 
    @user = User.find_by(:username => params[:username])
    
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect "/users/#{@user.id}"
    else 
        redirect "/login" 
    end
  end
  
  get "/users/:id" do 
    @user = current_user
    erb :"users/show"
  end

end
