class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :track_type, null: false
      t.text :lyrics
      t.integer :album_id, null: false
      t.timestamps null: false
    end

    add_index :tracks, :album_id
  end
end
