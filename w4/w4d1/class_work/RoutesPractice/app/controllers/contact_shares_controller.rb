class ContactSharesController < ApplicationController
  def index
    render json: ContactShare.all
  end

  def create
    @contact_share = ContactShare.new(contact_share_params)

    if @contact_share.save
      render json: @contact_share
    else
      render(
        json: @contact_share.errors.full_messages, status: 422
      )
    end
  end

  def destroy
    @contact_share = ContactShare.find_by(id: params[:id])

      if @contact_share.destroy
        render json: @contact_share
      else
        render json: @contact_share.errors.full_messages
      end
  end

  private

  def contact_share_params
    params[:contact_share].permit(:user_id, :contact_id)
  end
end
