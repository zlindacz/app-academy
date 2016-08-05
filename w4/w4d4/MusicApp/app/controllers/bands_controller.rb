class BandsController < ApplicationController
  before_action :require_logged_in!

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
  end

  def update
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
    @band = Band.new(band_params)
    unless @band.destroy
      flash.now[:errors] = @band.errors.full_messages
    end
    render :show
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
