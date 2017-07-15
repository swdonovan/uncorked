User.create(first_name: 'Admin', last_name: 'Of The Site', email: 'admin@admin.com', password: 'password', role: 2)
puts "Created admin user"

# def create_fake_venues
#    type = ["Bistro", "Winery", "Bar", "Pub", "Club", "Speak Easy"]
#    50.times do
#     venue = Venue.new
#     venue.name = "#{Faker::Witcher.character} #{type.sample}"
#     venue.street_address = Faker::Address.street_address
#     venue.state = Faker::Address.state
#     venue.zip = Faker::Address.zip
#     venue.latitude = Faker::Address.latitude
#     venue.longitude = Faker::Address.longitude
#     venue.save
#     puts "Venue #{venue.name} created"
#   end
# end
#
# create_fake_venues
