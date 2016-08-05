class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :track, null: false
      t.string :recorded_type, null: false
      t.integer :band_id, null: false
      t.timestamps null: false
    end

    add_index :albums, :band_id
  end
end
