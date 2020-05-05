class ContactsController < ApplicationController
    
  get "/contacts" do 
    redirect_if_not_logged_in
    @user = User.find_by(:username => params[:username])
    @user = current_user
    @contact = Contact.all
    erb :"contacts/index"
  end 
  
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
    @contact = find_contact 
    if logged_in?
      if authorized?(@contact)
        erb :"contacts/show"
    else 
      flash[:message] = "oops, you do not have access to this page"
      redirect "/contacts" 
      end
    end
  end 
  
  
  get "/contacts/:id/edit" do
   @contact = find_contact 
    if logged_in?
      if authorized?(@contact)
        erb :"contacts/edit"
    else 
      flash[:message] = "oops, you do not have access to this page"
      redirect "/contacts" 
      end
    end
  end 
  
  
  patch "/contacts/:id" do 
    @contact = find_contact
    if logged_in?
      if authorized?(@contact)
          @contact.name = params[:name]
          @contact.phone = params[:phone]
          @contact.email = params[:email]
          @contact.address = params[:address]
          @contact.save
          redirect to "/contacts/#{@contact.id}/show"
        else 
          redirect "/contacts/#{current_user.id}/edit"
      end
    end
  end 
  
  delete "/contacts/:id" do 
    find_contact 
    if authorized?(@contact)
      @contact.delete
      redirect "/contacts"
    else 
     #are you sure you want to delete
     #flash message contact has been deleted 
      redirect "/contacts"
    end
  end 
  
end 