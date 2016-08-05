class ChangeAlbumTrackName < ActiveRecord::Migration
  def change
    rename_column :albums, :track, :album_name 
  end
end
