class ContactsController < ApplicationController
  get "/contacts/new" do 
    erb :"contacts/new"
  end 
  
  post "/contacts/new" do 
    @contact = current_user.contacts.create(params)
    erb :"contacts/show"
  end 
  
  get "/contacts/:id/edit" do
    @contact = current_user.contacts.find_by_id(params[:id])
    erb :"contacts/edit"
  end 
  
  post "/contacts/:id/edit" do 
    redirect "/contacts/:id/edit"
  end
  
  patch "/contacts/:id" do 
    @contact = current_user.contacts.find_by_id(params[:id])
    @contact.name = params[:name]
    @contact.phone = params[:phone]
    @contact.email = params[:email]
    @contact.address = params[:address]
    @contact.save
    erb:"contacts/show"
  end 
  
  delete "/contacts/:id" do 
     @contact = current_user.contacts.find_by_id(params[:id])
     @contact.delete
     #are you sure you want to delete
     #flash message contact has been deleted 
     erb :"contacts/show"
  end 
  
end 