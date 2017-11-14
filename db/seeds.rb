20.times do
  User.create!(first_name: Faker::Name.first_name,
              last_name: Faker::Name.first_name,
              password: "password",
              password_confirmation: "password",
              email: Faker::Internet.email,
              host: true,
              birthday: Faker::Date.birthday(18, 100),
              phone_number: Faker::PhoneNumber.phone_number)
end
user_array = User.all


10.times do
  Space.create!(title: Faker::Address.community,
              description: Faker::Lorem.paragraph,
              price: Faker::Number.between(10, 100),
              rules: Faker::Lorem.sentence,
              location: Faker::Address.street_address,
              city: Faker::Address.city,
              state: Faker::Address.state_abbr,
              country: Faker::Address.country,
              owner: user_array.sample)
end
space_array = Space.all

5.times do
  Booking.create!(space: space_array.sample,
                renter: user_array.sample,
                start_time: Faker::Time.between(DateTime.now - 1.minute, DateTime.now, :morning),
                end_time: Faker::Time.between(DateTime.now - 1.minute, DateTime.now, :afternoon))
end
booking_array = Booking.all

5.times do
  RenterRating.create!(booking: booking_array.sample,
                      review: Faker::Lorem.paragraph,
                      stars: [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5].sample)
end

5.times do
  SpaceRating.create!(booking: booking_array.sample,
                      comment: Faker::Lorem.paragraph,
                      score: [1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5].sample)
end


amenities = ["Wifi", "Coffee", "Restrooms", "Seating", "Outlets", "Fridge", "Parking", "Tables"]
amenities.each do |amenity|
  Amenity.create(name: amenity)
end
amenity_array = Amenity.all

10.times do
  SpaceAmenity.create!(space: space_array.sample,
                      amenity: amenity_array.sample)
end

Space.create(title: "DBC Office", description: "Heaven on earth", price: 100, rules: "no speaking", location: "1705 Guadalupe St, Austin, TX 78701", city: "Austin", state: "TX", country: "USA", owner_id: 1)
Space.create(title: "Noah's House", description: "Pretty neat spot", price: 100, rules: "no speaking", location: "2207 South 3rd St., Austin, TX", city: "Austin", state: "TX", country: "USA", owner_id: 1)
Space.create(title: "Noah's old house", description: "childhood home", price: 100, rules: "no speaking", location: "4036 Enclave Mesa Circle, Austin, TX", city: "Austin", state: "TX", country: "USA", owner_id: 1)
Space.create(title: "Alamo Drafthouse", description: "baaa ba ba ba ba ba", price: 100, rules: "actually no speaking", location: "1120 S Lamar Blvd, Austin, TX 78704", city: "Austin", state: "TX", country: "USA", owner_id: 1)
Space.create(title: "Bob Bullock Museum", description: "A museum yay", price: 100, rules: "no speaking", location: "1800 Congress Ave, Austin, TX 78701", city: "Austin", state: "TX", country: "USA", owner_id: 1)
Space.create(title: "Torchy's Tacos", description: "Good eats", price: 100, rules: "no speaking", location: "3005 S Lamar Blvd, Austin, TX", city: "Austin", state: "TX", country: "USA", owner_id: 1)

