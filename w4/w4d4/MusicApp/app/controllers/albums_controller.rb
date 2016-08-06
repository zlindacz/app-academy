class AlbumsController < ApplicationController
  before_action :require_logged_in!

  def show
    @album = Album.find_by(id: params[:id])
  end

  def new
    @album = Album.new
    @band = Band.find_by(params[:band_id])
  end

  def create
    @album = Album.new(album_params)
    @band = Band.find_by(params[:band_id])

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @album.errors.full_messages
      render :new
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    if @album.destroy
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @album.errors.full_messages
      render :show
    end
  end

  private

  def album_params
    params.require(:album).permit(:album_name, :recorded_type, :band_id)
  end
end
