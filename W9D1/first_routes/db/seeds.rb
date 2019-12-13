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

    users = User.create([
        { username: 'elizabeth'}, 
        { username: 'rapkat'},
        { username: 'andy'},
        { username: 'trevor'}])
    
    artworks = Artwork.create([
        { title: 'dang, it''s art', image_url: 'img1.link', artist_id: users[0].id }, 
        { title: 'rapkat10''s art', image_url: 'img2.link', artist_id: users[1].id },
        { title: 'sir stache', image_url: 'img3.link', artist_id: users[2].id }])

    artwork_shares = ArtworkShare.create([
        { artwork_id: artworks[2].id, viewer_id: users[0].id },
        { artwork_id: artworks[2].id, viewer_id: users[1].id },
        { artwork_id: artworks[2].id, viewer_id: users[3].id },
        { artwork_id: artworks[0].id, viewer_id: users[0].id },
        { artwork_id: artworks[0].id, viewer_id: users[2].id }])

    comments = Comment.create([
        { user_id: users[0].id, artwork_id: artworks[2].id, body: 'fan-stache-tic teacher' },
        { user_id: users[3].id, artwork_id: artworks[1].id, body: 'what a beauty' },
        { user_id: users[3].id, artwork_id: artworks[2].id, body: 'i mustache you a question' },
        { user_id: users[1].id, artwork_id: artworks[0].id, body: 'dangg, that'' art' }])
    