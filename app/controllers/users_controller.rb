class UsersController < ApplicationController
  
  get "/signup" do 
    erb :create_user 
  end 
  
   if params[:username] == "" || params[:password] == ""
      redirect '/failure'
    else
      User.create(username: params[:username], password: params[:password])
      redirect '/login'
    end
  end

end 