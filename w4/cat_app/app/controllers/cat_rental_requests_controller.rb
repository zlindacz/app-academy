class CatRentalRequestsController < ApplicationController

  def new
    @request = CatRentalRequest.new
  end

  def create
    @request = CatRentalRequest.new(request_params)

    if @request.save
      redirect_to cat_url(Cat.find_by_id(params[:request][:cat_id]))
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @cat.errors.full_messages.to_sentence
      render :new
    end
  end

  def approve!
    @request = CatRentalRequest.find_by_id(params[:id])
    @request.approve!
    redirect_to cat_url(Cat.find_by_id(@request.cat_id))
  end

  def deny!
    @request = CatRentalRequest.find_by_id(params[:id])
    @request.deny!
    redirect_to cat_url(Cat.find_by_id(@request.cat_id))
  end

  private

  def request_params
    params.require(:request).permit(:cat_id, :start_date, :end_date, :status)
  end
end
