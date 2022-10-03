# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Create a main sample Admin.
isAdmin = User.create!(
    username: 'Admin',
    contact: '1234567890',
    email: 'admin100@test.com',
    password: 'password',
    password_confirmation: 'password'
)
  isAdmin.toggle!(:isAdmin)

# Create a main sample User.
user = User.create!(
    username: 'User',
    contact: '1234567890',
    email: 'regular100@test.com',
    password: 'password',
    password_confirmation: 'password'
)

# Create a main sample User.
user2 = User.create!(
    username: 'User1',
    contact: '1234567890',
    email: 'regularuser200@test.com',
    password: 'password',
    password_confirmation: 'password'
)

# Create hotels
hotel = Hotel.create!(
    name: 'The Leela Ambience Convention Hotel',
    about: 'orem Ipsum is simply dummy text of the printing and typesetting industry.',
    address: 'DLF City Phase 3, Gurgaon, Haryana 122002',
    city: 'Gurgaon',
    longitude: '77.0333',
    latitude: '28.4500'
)
hotel.image.attach(io: File.open('app/assets/images/photos/hotel1.jpg'), filename: 'hotel1.jpg')

hotel1 = Hotel.create!(
    name: 'The Taj Mahal Palace',
    about: 'orem Ipsum is simply dummy text of the printing and typesetting industry.',
    address: 'Apollo Bunder, Colaba, Mumbai, Maharashtra 400001',
    city: 'Mumbai',
    longitude: '72.8333',
    latitude: '18.9333'
)
hotel1.image.attach(io: File.open('app/assets/images/photos/hotel2.jpg'), filename: 'hotel2.jpg')

hotel2 = Hotel.create!(
    name: 'ITC Royal Bengal',
    about: 'orem Ipsum is simply dummy text of the printing and typesetting industry.',
    address: '1, Jawaharlal Nehru Road, Kolkata, West Bengal 700071',
    city: 'Kolkata',
    longitude: '88.3667',
    latitude: '22.5667'
)
hotel2.image.attach(io: File.open('app/assets/images/photos/hotel3.jpg'), filename: 'hotel3.jpg')

room1 = Room.create!(
    room_type: 'Deluxe Room',
    price: '5000',
    hotel_id: hotel.id,
   
)
room1.image.attach(io: File.open('app/assets/images/photos/room1.jpg'), filename: 'room1.jpg')

room2 = Room.create!(
    room_type: 'President Suite',
    price: '6000',
    hotel_id: hotel.id,
    
)
room2.image.attach(io: File.open('app/assets/images/photos/room2.jpg'), filename: 'room2.jpg')

room3 = Room.create!(
    room_type: 'Luxury Suite',
    price: '4500',
    hotel_id: hotel1.id,
   
)
room3.image.attach(io: File.open('app/assets/images/photos/room3.jpg'), filename: 'room3.jpg')

room4 = Room.create!(
    room_type: 'Deluxe Room',
    price: '5000',
    hotel_id: hotel1.id,
   
)
room4.image.attach(io: File.open('app/assets/images/photos/room4.jpg'), filename: 'room4.jpg')

room5 = Room.create!(
    room_type: 'President Suite',
    price: '5000',
    hotel_id: hotel1.id,
    
)
room5.image.attach(io: File.open('app/assets/images/photos/room5.jpg'), filename: 'room5.jpg')

room6 = Room.create!(
    room_type: 'Luxury Suite',
    price: '4500',
    hotel_id: hotel2.id,
    
)
room6.image.attach(io: File.open('app/assets/images/photos/room6.jpg'), filename: 'room6.jpg')

room7 = Room.create!(
    room_type: 'Deluxe Room',
    price: '5000',
    hotel_id: hotel2.id,
    
)
room7.image.attach(io: File.open('app/assets/images/photos/room7.jpg'), filename: 'room7.jpg')

# Create bookings
booking = Booking.create!(
    user_id: user.id,
    room_id: room1.id,
    adults: '2',
    child: '1',
    start_date: '2022-10-15',
    end_date: '2022-10-18',
    is_approved: true
)

booking1 = Booking.create!(
    user_id: user.id,
    room_id: room2.id,
    adults: '2',
    child: '1',
    start_date: '2022-10-15',
    end_date: '2022-10-18',
    is_approved: false
)

