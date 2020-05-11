class UsersController < ApplicationController
  
  get "/signup" do 
    erb :"users/signup"
  end 
  
  post "/signup" do 
    erb :"users/signup"
  end 
  
  post "/users" do 
    @user = User.new(params)
    if @user.valid? 
        @user.save
      redirect '/login'
    else
      flash[:message] = "Signup Failed, please try again"
      redirect '/signup'
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
      flash[:message] = "username and/or password not valid. please try again."
      redirect "/login" 
    end
  end
  
  get "/users/:id" do 
    @user = User.find_by(:username => params[:username])
    redirect_if_not_authorized
    @user = current_user
      erb :"users/show" 
    # else 
    #   flash[:message] = "oops, you do not have access to this page" 
    #   redirect "/"
    # end
  end

 get "/logout" do 
    session.clear 
    redirect "/"
  end 
  
end
