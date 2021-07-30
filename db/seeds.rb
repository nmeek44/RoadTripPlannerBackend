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
user1 = User.create(username: "Nick", password: "123")
user2 = User.create(username: "Eric", password: "123" )
user3 = User.create(username: "David", password: "123")

puts "Seeding Trip"
trip1 = Trip.create(name: "NY-CHC", startLatitude: "40.7128 N", startLongitude: "74.0060 W", user_id: user1)
trip2 = Trip.create(name: "LA-SEA", startLatitude: "47.6062 N", startLongitude: "122.3321 W", user_id: user2)
trip3 = Trip.create(name: "PHL-MIA", startLatitude: "39.9526 N", startLongitude: "75.1652 W W", user_id: user3)


puts "Seeding Location"
location1 = Location.create(name: "New York City", locationLatitude: "40.7128 N", locationLongitude: "74.0060 W", trip_id: trip1 )
location2 = Location.create(name: "Chicago", locationLatitude: "41.8781 N", locationLongitude: "87.6298 W", trip_id: trip1 )
location3 = Location.create(name: "Los Angeles", locationLatitude: "34.0522 N", locationLongitude: "118.2437 W", trip_id: trip2 )
location4 = Location.create(name: "Seattle", locationLatitude: "47.6062 N", locationLongitude: "122.3321 W", trip_id: trip2 )
location5 = Location.create(name: "Philadelphia", locationLatitude: "39.9526 N", locationLongitude: "75.1652 W", trip_id: trip3 )
location6 = Location.create(name: "Miami", locationLatitude: "25.7617 N", locationLongitude: "80.1918 W", trip_id: trip3 )

puts "Seeding Activity"
activity1 = Activity.create(name: "Joe's Pizza", address: "7 Carmine St", image: "https://cdn.vox-cdn.com/thumbor/WfxgN40Og3EScqq7k0SeSJe3zUQ=/0x0:1000x750/1400x1400/filters:focal(420x295:580x455):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/56181245/joe_s_pizza_times_square.0.jpg", description:"Best NY Pizza", actLatitude:"40.7298734 N", actLongitude:"74.0021314 W", location_id: location1)
activity2 = Activity.create(name: "Lou Malnati's Pizzeria", address: "6649 Lincoln Ave", image: "https://www.loumalnatis.com/resources/assets/images/logo2x.png", description:"Best Chicago Pizza", actLatitude:"41.8884213 N", actLongitude:"87.6803093 W", location_id: location2)
activity3 = Activity.create(name: "Pizzana West Hollywood", address: "460N Robertson Blvd", image: "https://pizzana.com/wp-content/uploads/2018/01/PZ_logo_final_pizzana2.svg", description:"Best LA Pizza", actLatitude:"34.0665894 N", actLongitude:"118.4603338 W", location_id: location3)
activity4 = Activity.create(name: "Dino's Tomato Pie", address: "1524 E Olive Way", image: "https://www.dinostomatopie.com/images/dino-script-black.png", description:"Best Seattle Pizza", actLatitude:"47.6150481 N", actLongitude:"122.3290775 W", location_id: location4)
activity5 = Activity.create(name: "Pizzeria Beddia", address: "1313 N Lee St", image: "https://images.squarespace-cdn.com/content/v1/5c6c6c2cd74562a8dedfebeb/1553186459448-6QUZBG0BAZNADSWDY9TI/Pizzeria+Beddia.png", description:"Best Philly Pizza", actLatitude:"39.9707386 N", actLongitude:"75.1374192 W", location_id: location5)
activity6 = Activity.create(name: "Andiamo! Brick Oven Pizza", address: "5600 Biscayne Blvd", image: "https://images.squarespace-cdn.com/content/v1/5e338d47dfdfe875b2e2766c/1587061262029-JOVAK454EW6C0G9Y9C3M/Andiamo_Logo.png?format=1500w", description:"Best Miami Pizza", actLatitude:"25.8131736 N", actLongitude:"80.1873404 W", location_id: location6)

puts "Done Seeding."