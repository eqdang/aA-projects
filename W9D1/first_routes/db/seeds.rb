# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    #user
    #artwork_share
    #artwork

    users = User.create([{ username: 'eqdang'}, { username: 'rapkat10'}])
    
    artworks = Artwork.create([{ title: 'eqdang''s art', image_url: 'link1', artist_id: 1, id: 100 }, { title: 'rapkat10''s art', image_url: 'link_1', artist_id: 2, id: 200 }])

    artwork_shares = ArtworkShare.create([{ artwork_id: 100, viewer_id: 1}, { artwork_id: 200, viewer_id: 2 }])
    