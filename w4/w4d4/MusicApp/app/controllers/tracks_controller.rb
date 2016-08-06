class TracksController < ApplicationController
  before_action :require_logged_in!

  def show
    @track = Track.find_by(id: params[:id])
  end

  def new
    @track = Track.new
    @album = Album.find_by(id: params[:album_id])
  end

  def create
    @track = Track.new(track_params)
    @album = Album.find_by(id: params[:album_id])

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @track.errors.full_messages
      render :new
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track.destroy
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] += @track.errors.full_messages
      render :show
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :track_type, :lyrics, :album_id)
  end
end
