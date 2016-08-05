Band.create!(name: "Jimmy")
Band.create!(name: "Sammy")

Album.create!(album_name: "Soon", recorded_type: "studio", band_id: 1)
Album.create!(album_name: "Now", recorded_type: "live", band_id: 1)
Album.create!(album_name: "June", recorded_type: "studio", band_id: 2)
Album.create!(album_name: "July", recorded_type: "live", band_id: 2)

Track.create!(track_type: "Regular", lyrics: "ddkfn", name: "do", album_id: 1)
Track.create!(track_type: "Regular", lyrics: "dskfn", name: "re", album_id: 1)
Track.create!(track_type: "Bonus", lyrics: "dbxdkfn", name: "mi", album_id: 2)
Track.create!(track_type: "Bonus", lyrics: "dkfn", name: "fa", album_id: 2)

Track.create!(track_type: "Regular", lyrics: "fn", name: "so", album_id: 3)
Track.create!(track_type: "Regular", lyrics: "kfn", name: "la", album_id: 3)
Track.create!(track_type: "Bonus", lyrics: "dvvkfn", name: "ti", album_id: 4)
Track.create!(track_type: "Bonus", lyrics: "d82dkfn", name: "dodo", album_id: 4)
