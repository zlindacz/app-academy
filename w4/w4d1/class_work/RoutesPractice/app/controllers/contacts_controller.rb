class ContactsController < ApplicationController
  def index
    if params.has_key?(:user_id)
      @contacts = Contact.where(user_id: params[:user_id])
    else
      @contacts = Contact.all
    end
    render json: @contacts
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render json: @contact
  end


  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
        render(
          json: @contact.errors.full_messages, status: 422
        )
    end
  end

  def update
    @contact = Contact.find_by(id: params[:id])

    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])

    if @contact.destroy
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end


  private
  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end

end
