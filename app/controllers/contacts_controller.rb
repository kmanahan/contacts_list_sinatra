class ContactsController < ApplicationController
  get "/contacts/new" do 
    erb :"contacts/new"
  end 
  
  post "/contacts/new" do 
    @contact = current_user.contacts.create(params)
    erb :"contacts/show"
  end 
end 