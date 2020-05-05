class ContactsController < ApplicationController
  get "/contacts/new" do 
     redirect_if_not_logged_in
    erb :"contacts/new"
  end 
  
  post "/contacts/new" do 
     redirect_if_not_logged_in
      @contact = Contact.new(params)
      if @contact.valid?
        @contact.save
        @contact = current_user.contacts.create(params)
        redirect "/contacts/#{@contact.id}/show"
      else
        flash[:message] = "something went wrong"
        redirect "contacts/new"
      end 
    end
  
  get "/contacts/:id/show" do 
    @contact = current_user.contacts.find(params[:id])
    erb :"contacts/show"
  end 
  
  post "/contacts/:id/show" do 
    @contact = current_user.contacts.find(params[:id])
    erb :"contacts/show"
  end 
  
  get "/contacts/:id/edit" do
    @contact = current_user.contacts.find(params[:id])
    erb :"contacts/edit"
  end 
  
  post "/contacts/:id/edit" do
     @contact = current_user.contacts.find(params[:id])
    redirect "/contacts/:id/edit"
  end
  
  patch "/contacts/:id" do 
    @contact = current_user.contacts.find(params[:id])
    @contact.name = params[:name]
    @contact.phone = params[:phone]
    @contact.email = params[:email]
    @contact.address = params[:address]
    @contact.save
    redirect to "/contacts/#{@contact.id}/show"
  end 
  
  get "/contacts" do 
    @user = User.find_by(:username => params[:username])
    @user = current_user
    @contact = Contact.all
    erb :"contacts/index"
  end 
  
  delete "/contacts/:id" do 
     @contact = current_user.contacts.find(params[:id])
     @contact.delete
     #are you sure you want to delete
     #flash message contact has been deleted 
     redirect "/contacts"
  end 
  
end 