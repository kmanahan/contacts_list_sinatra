class ContactsController < ApplicationController
  get "/contacts/new" do 
    erb :"contacts/new"
  end 
  
  post "/contacts/new" do 
    @contact = current_user.contacts.create(params)
    erb :"contacts/show"
  end 
  
  get "/contacts/:id/edit" do
    @edit = Contact.find_by_id(params[:id])
    erb :"contacts/edit"
  end 
  
  post "/contacts/:id/edit" do 
    redirect "/contacts/:id/edit"
  end
  
  patch "contacts/:id" do 
    @edit.update
    erb:"contacts/show"
  end 
end 