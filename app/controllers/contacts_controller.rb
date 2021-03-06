class ContactsController < ApplicationController

def new
  
	  @contact = Contact.new
  end

 def index
    @contacts = Contact.all
  end
 
  def show
    @contact = Contact.find(params[:id])
  end

  def edit
  @contact = Contact.find(params[:id])
end

  def create
  @contact = Contact.new(contact_params)
 @contact.user_id = current_user.id
  if @contact.save
    render '/contacts/message'
  else
    render 'new'
  end
end

def get_contact_data
contact = Contact.find(params[:contact_id])
render :partial => 'data',:locals => {:contact => contact}
end

def message  
end
 
def update
  @contact = Contact.find(params[:id])
 
  if @contact.update(contact_params)
    redirect_to @contact
  else
    render 'edit'
  end
end

def destroy
  @contact = Contact.find(params[:id])
  @contact.destroy
 
  redirect_to contacts_path
end

private
  def contact_params
    params.require(:contact).permit(:name, :message , :user_id)
  end

end
