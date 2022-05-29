# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

lucy = User.create(id: 8, username: "xlucyluo")
adam = User.create(id: 1998, username: "bufeau")
destroyer = User.create(id: 1, username:"byebye")

imshy = Artwork.create(title: "imshy", image_url: "www.collimgs.com/img/4928374", artist_id: lucy.id)
youcandoit = Artwork.create(title: "apple", image_url: "www.collimgs.com/img/4984893", artist_id: adam.id)
badartwork = Artwork.create(title: "bad", image_url: "www.collimgs.com/img/6666666", artist_id: destroyer.id)

share1 = ArtworkShare.create(artwork_id: imshy.id, viewer_id: lucy.id)
share2 = ArtworkShare.create(artwork_id: imshy.id, viewer_id: adam.id)
share3 = ArtworkShare.create(artwork_id: youcandoit.id, viewer_id: lucy.id)
share3 = ArtworkShare.create(artwork_id: youcandoit.id, viewer_id: destroyer.id)

comment1 = Comment.create(artwork_id: imshy.id, user_id: adam.id, body: "lol i dont like shy girls")
comment2 = Comment.create(artwork_id: imshy.id, user_id: lucy.id, body: "shy girls are the best")
comment3 = Comment.create(artwork_id: youcandoit.id, user_id: destroyer.id, body: "im going to kick all shy girls")
comment4 = Comment.create(artwork_id: badartwork.id, user_id: lucy.id, body: "aren't you that one racist guy?")