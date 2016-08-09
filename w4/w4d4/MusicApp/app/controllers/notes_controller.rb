class NotesController < ApplicationController

  def create
    @note = Note.new(note_params)
    @track = Track.find_by(params[:track_id])
    flash.now[:errors] ||= []
    flash.now[:errors] << @note.errors.full_messages unless @note.save
    redirect_to track_url(@track)
  end

  private

  def note_params
    params.require(:note).permit(:body, :user_id, :track_id)
  end

end
