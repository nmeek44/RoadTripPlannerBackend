# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting Old Data"
User.delete_all 
Trip.delete_all
Location.delete_all
Activity.delete_all


puts "Seeding User"
user1 = User.create(username: "Nick", password_digest: "123")
user2 = User.create(username: "Eric", password_digest: "123")
user3 = User.create(username: "Greg", password_digest: "123")

puts "Seeding Trip"
trip1 = Trip.create(name: "NY-CHC", startLatitude: 40.7128, startLongitude: 74.0060, user_id: user1.id)
trip2 = Trip.create(name: "LA-SEA", startLatitude: 47.6062, startLongitude: 122.3321, user_id: user2.id)
trip3 = Trip.create(name: "PHL-MIA", startLatitude: 39.9526, startLongitude: 75.1652, user_id: user3.id)


puts "Seeding Location"
location1 = Location.create(name: "New York City", locationLatitude: 40.7128, locationLongitude: 74.0060, trip_id: trip1.id )
location2 = Location.create(name: "Chicago", locationLatitude: 41.8781, locationLongitude: 87.6298, trip_id: trip1.id )
location3 = Location.create(name: "Los Angeles", locationLatitude: 34.0522, locationLongitude: 118.2437, trip_id: trip2.id )
location4 = Location.create(name: "Seattle", locationLatitude: 47.6062, locationLongitude: 122.3321, trip_id: trip2.id )
location5 = Location.create(name: "Philadelphia", locationLatitude: 39.9526, locationLongitude: 75.1652, trip_id: trip3.id )
location6 = Location.create(name: "Miami", locationLatitude: 25.7617, locationLongitude: 80.1918, trip_id: trip3.id )

puts "Seeding Activity"
activity1 = Activity.create(name: "Joe's Pizza", address: "7 Carmine St", image: "https://cdn.vox-cdn.com/thumbor/WfxgN40Og3EScqq7k0SeSJe3zUQ=/0x0:1000x750/1400x1400/filters:focal(420x295:580x455):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/56181245/joe_s_pizza_times_square.0.jpg", description:"Best NY Pizza", actLatitude: 40.7298734, actLongitude: 74.0021314, location_id: location1.id)
activity2 = Activity.create(name: "Lou Malnati's Pizzeria", address: "6649 Lincoln Ave", image: "https://www.loumalnatis.com/resources/assets/images/logo2x.png", description:"Best Chicago Pizza", actLatitude: 41.8884213, actLongitude: 87.6803093, location_id: location2.id)
activity3 = Activity.create(name: "Pizzana West Hollywood", address: "460N Robertson Blvd", image: "https://pizzana.com/wp-content/uploads/2018/01/PZ_logo_final_pizzana2.svg", description:"Best LA Pizza", actLatitude: 34.0665894, actLongitude: 118.4603338, location_id: location3.id)
activity4 = Activity.create(name: "Dino's Tomato Pie", address: "1524 E Olive Way", image: "https://www.dinostomatopie.com/images/dino-script-black.png", description:"Best Seattle Pizza", actLatitude: 47.6150481, actLongitude: 122.3290775, location_id: location4.id)
activity5 = Activity.create(name: "Pizzeria Beddia", address: "1313 N Lee St", image: "https://images.squarespace-cdn.com/content/v1/5c6c6c2cd74562a8dedfebeb/1553186459448-6QUZBG0BAZNADSWDY9TI/Pizzeria+Beddia.png", description:"Best Philly Pizza", actLatitude: 39.9707386, actLongitude: 75.1374192, location_id: location5.id)
activity6 = Activity.create(name: "Andiamo! Brick Oven Pizza", address: "5600 Biscayne Blvd", image: "https://images.squarespace-cdn.com/content/v1/5e338d47dfdfe875b2e2766c/1587061262029-JOVAK454EW6C0G9Y9C3M/Andiamo_Logo.png?format=1500w", description:"Best Miami Pizza", actLatitude: 25.8131736, actLongitude: 80.1873404, location_id: location6.id)

puts "Done Seeding."