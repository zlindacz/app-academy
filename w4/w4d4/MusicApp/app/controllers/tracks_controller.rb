class TracksController < ApplicationController
  before_action :require_logged_in!

  def show
    @track = Track.find_by(id: params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    if @track.destroy
      redirect_to album_url(@track.album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :show
    end
  end
end
