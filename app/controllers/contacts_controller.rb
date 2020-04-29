class ContactsController < ApplicationController
  get "/contacts/new" do 
    erb :"contacts/new"
  end 
  
  post "/contacts/new" do 
    @contact = Contact.create(params)
    erb :"contacts/show"
  end 
end 