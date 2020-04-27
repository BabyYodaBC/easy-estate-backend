# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Listing.destroy_all
FollowListing.destroy_all
Comment.destroy_all

# seed image urls
# file = open(url)
# user.image.attach(io: file, filename: "temp.#{file.content_type_parse.first.split("/").last}", content_type: file.content_type_parse.first)

mikey = User.create!({first_name: "Mikey", last_name: "Smith", email: "mikeysmith@gmail.com", password: "123", pro_pic: ENV['Default1'], city: "New York", state: "NY", realtor: false})
laura = User.create!({first_name: "Laura ", last_name: "Jones", email: "laurajones@gmail.com", password: "123", pro_pic: ENV['Default2'], city: "New York", state: "NY", realtor: true})
diana = User.create!({first_name: "Diana ", last_name: "Johnson", email: "dianajohnson@gmail.com", password: "123", pro_pic: ENV['Default3'], city: "Los Angeles", state: "CA", realtor: false})
gabi = User.create!({first_name: "Gabi ", last_name: "Cohen", email: "gabicohen@gmail.com", password: "123", pro_pic: ENV['Default4'], city: "Houston", state: "TX", realtor: false})
cory = User.create!({first_name: "Cory ", last_name: "Stevens", email: "corystevens@gmail.com", password: "123", pro_pic: ENV['Default5'], city: "Trenton", state: "NJ", realtor: true})
vin = User.create!({first_name: "Vin ", last_name: "Soprano", email: "vinsoprano@gmail.com", password: "123", pro_pic: ENV['Default6'], city: "Meadowlands", state: "NJ", realtor: false})

p "users seeded"

listing_one = Listing.create!({owner_id: laura.id, price: 3300000, p_contact: "111-555-5555", address: "432 Park Ave", city: "New York", state: "NY", zipcode:"10010", neighborhood: "Midtown", features: "stainless steel fridge, wine bar", bed: 2, bath: 1, sqr_foot: 1200, default_image: [ENV['Aimg1'], ENV['Aimg2'], ENV['Aimg3'], ENV['Aimg4']], longitude: 40.7616, latitude: 73.9718 })
listing_two = Listing.create!({owner_id: laura.id, price: 1800000,  p_contact: "222-555-5555", address: "405 East 42nd Street", city: "New York", state: "NY", zipcode: "10017", neighborhood: "SoHo", features: "marble countertops, coffee maker", bed: 3, bath: 2, sqr_foot: 1500, default_image: [ENV['Bimg1'], ENV['Bimg2'], ENV['Bimg3']], longitude: 40.7549, latitude: 73.9840 })
listing_three = Listing.create!({owner_id: gabi.id, price: 630000, p_contact: "333-555-5555", address: "1601 E NASA Pkwy", city: "Houston", state: "TX", zipcode: "77058", neighborhood: "Clear Lake", features: "garage, backyard patio", bed: 5, bath: 5, sqr_foot: 5200, default_image: [ENV['Cimg1'], ENV['Cimg2'], ENV['Cimg3']], longitude: 29.5518, latitude: 95.0983 })
listing_four = Listing.create!({owner_id: diana.id, price: 3200000, p_contact: "444-555-5555", address: "2800 E Observatory Rd", city: "Los Angeles", state: "CA", zipcode: "90027", neighborhood: "HollyWood Hills", features: "pool, 5 car garage", bed: 6, bath: 6, sqr_foot: 6100, default_image: [ENV['Dimg1'], ENV['Dimg2'], ENV['Dimg3']], longitude: 34.1184, latitude: 118.3004 })
listing_five = Listing.create!({owner_id: cory.id, price: 400000, p_contact: "555-555-5555", address: "1 Six Flags Blvd", city: "Jackson", state: "NJ", zipcode: "08527", neighborhood: "Monmouth", features: "driveway", bed: 5, bath: 3, sqr_foot: 4700, default_image: [ENV['Eimg1'], ENV['Eimg2'], ENV['Eimg3']], longitude: 74.4406, latitude: 40.1386 })
listing_six = Listing.create!({owner_id: vin.id, price: 1300000, p_contact: "666-555-5555", address: "1801 Ocean Ave", city: "Belmar", state: "NJ", zipcode: "07719", neighborhood: "Belmar", features: "kids playground, finished basement", bed: 7, bath: 6, sqr_foot: 7850, default_image: [ENV['Fimg1'], ENV['Fimg2'], ENV['Fimg3']], longitude: 40.1703, latitude: 74.0164 })

p "listings seeded"

FollowListing.create(follower_id: cory.id, listing_id: listing_four.id)
FollowListing.create(follower_id: mikey.id, listing_id: listing_one.id)
FollowListing.create(follower_id: mikey.id, listing_id: listing_three.id)
FollowListing.create(follower_id: mikey.id, listing_id: listing_five.id)
FollowListing.create(follower_id: diana.id, listing_id: listing_six.id)
FollowListing.create(follower_id: vin.id, listing_id: listing_three.id)
p "follow-listings seeded"

Comment.create(user_id: cory.id, listing_id: listing_four.id, content: 'cool test')
Comment.create(user_id: vin.id, listing_id: listing_three.id, content: 'fool test')
Comment.create(user_id: vin.id, listing_id: listing_three.id, content: 'drool test')
Comment.create(user_id: diana.id, listing_id: listing_six.id, content: 'nice place')
Comment.create(user_id: mikey.id, listing_id: listing_one.id, content: 'thats a big one')
Comment.create(user_id: diana.id, listing_id: listing_six, content: 'tool test')
p "comments seeded"

# ListingImageBin.create(listing_id: listing_one.id, image1: ENV['Aimg1'], image2: ENV['Aimg2'], image3: ENV['Aimg3'], image4: ENV['Aimg4'])
# ListingImageBin.create(listing_id: listing_two.id, image1: ENV['Bimg1'], image2: ENV['Bimg2'], image3: ENV['Bimg3'])
# ListingImageBin.create(listing_id: listing_three.id, image1: ENV['Cimg1'], image2: ENV['Cimg2'], image3: ENV['Cimg3'])
# ListingImageBin.create(listing_id: listing_four.id, image1: ENV['Dimg1'], image2: ENV['Dimg2'], image3: ENV['Dimg3'])
# ListingImageBin.create(listing_id: listing_five.id, image1: ENV['Eimg1'], image2: ENV['Eimg2'], image3: ENV['Eimg3'])
# ListingImageBin.create(listing_id: listing_six.id, image1: ENV['Fimg1'], image2: ENV['Fimg2'], image3: ENV['Fimg3'])

# p "image bins seeded"

p "Seeds have been planted"