require "open-uri"
require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts 'Creating feasts...'

puts "Start time is #{Time.now}"
puts "--------------------------"
Feast.destroy_all
User.destroy_all
Reservation.destroy_all

puts 'Creating a fake user...'
file = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599472451/Avatar_Camila_2020_m3x0hw.jpg')
user = User.create(first_name: "Camila", last_name: "Miorelli", email: "a@a.com", password: 123456, bio:"Heyyy this is my bio I am cool and i like to eat and thats about it how are you", gender: "female", admin: true)
user.photo.attach(io: file, filename: 'camila.jpg', content_type: 'image/jpg')


ADDRESSES=["Reguliersgracht 17, Amsterdam", "Prinsengracht 10, Amsterdam", "Pannekoekstraat 110, Rotterdam", "Kelderwindkade 15, Haarlem", "Ijsbaanpad 9, Amsterdam"]
# MEALS=["indian", "cuban", "casual", "picnic", "french", "cozy", "dessert" "bistro", "soul food", "spicy", "healthy"]
# 5.times do

  # meal=MEALS.sample

  # feast = Feast.new(
  #   title: "Traditional #{meal} Cuisine",
  #   description: "I would like to invite everyone to my traditional indian feast.
  #   I am from the punjabi region of India and I would like to make a curry and have some friends over. The meal will be vegetarian friendly
  #   and also very spicy! Hope to meet you all soon.",
  #   user: user,
  #   meal_type: Faker::Restaurant.type,
  #   guest_limit: rand(5..20),
  #   price: rand(8..30),
  #   available: [true, false].sample,
  #   address: ADDRESSES.sample,
  #   start_at:(DateTime.new),
  #   end_at:(DateTime.new))
  #   feast.photo.attach(io: file, filename: 'Feast image', content_type: 'image/jpg')
  #   feast.save!

    indian = Feast.new(
      title: "Traditional Indian Cuisine",
      description: "I would like to invite everyone to my traditional indian feast. I am from the punjabi region of India and I would like to make a curry and have some friends over.",
      user: user,
      meal_type: "Vegetarian",
      guest_limit: 8,
      price: 20,
      available: true,
      address: "Reguliersgracht 17, Amsterdam",
      start_at: DateTime.new(2019, 12, 3, 18, 00, 0))
    indian.end_at = indian.start_at + 2.hours
    indian.save!

    cuban = Feast.new(
      title: "Camila's Lechon",
      description: "I will be making lechon asado for new friends!",
      user: user,
      meal_type: "Meat dish",
      guest_limit: 8,
      price: 20,
      available: true,
      address: "Pannekoekstraat 110, Rotterdam",
      start_at: DateTime.new(2018, 7, 11, 20, 10, 0))
    cuban.end_at = cuban.start_at + 2.hours
    cuban.save!

    casual = Feast.new(
      title: "Casual Friday Tapas",
      description: "Hey everyone, I'm not so great at cooking, but I would love to host some tapas at my house, i'll order a mixture of vegetarian and meat dishes,",
      user: user,
      meal_type: "Ominivore's Delight",
      guest_limit: 15,
      price: 10,
      available: true,
      address: "Ijsbaanpad 8, Amsterdam",
      start_at: DateTime.new(2019, 3, 6, 16, 0, 0))
    casual.end_at = casual.start_at + 2.hours
    casual.save!

    picnic = Feast.new(
      title: "Sunday Picnic at Vondel",
      description: "Looking to connect with people interested in design and vegan food, I would like to host a picnic in the park, everyone can bring some vegan snacks.",
      user: user,
      meal_type: "vegan",
      guest_limit: 25,
      price: 0,
      available: true,
      address: "Vondel Park, Amsterdam",
      start_at: DateTime.new(2020, 1, 10, 7, 30, 0))
    picnic.end_at = picnic.start_at + 2.hours
    picnic.save!

    french = Feast.new(
      title: "Thursday Night Patisserie",
      description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes",
      meal_type: "Dessert",
      user: user,
      guest_limit: 3,
      price: 10,
      available: true,
      address: "Prinsengracht 10, Amsterdam",
      start_at: DateTime.new(2020, 01, 10, 7, 30, 0))
    french.end_at = french.start_at + 2.hours
    french.save!

    french = Feast.new(
      title: "Thursday Night Patisserie",
      description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes",
      meal_type: "Dessert",
      user: user,
      guest_limit: 3,
      price: 10,
      available: true,
      address: "Prinsengracht 10, Amsterdam",
      start_at: DateTime.new(2020, 9, 7, 7, 30, 0))
    french.end_at = french.start_at + 2.hours
    french.save!

    french = Feast.new(
      title: "Thursday Night Patisserie",
      description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes",
      meal_type: "Dessert",
      user: user,
      guest_limit: 3,
      price: 10,
      available: true,
      address: "Prinsengracht 10, Amsterdam",
      start_at: DateTime.new(2020, 9, 8, 7, 30, 0))
    french.end_at = french.start_at + 2.hours
    french.save!

    french = Feast.new(
      title: "Thursday Night Patisserie",
      description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes",
      meal_type: "Dessert",
      user: user,
      guest_limit: 3,
      price: 10,
      available: true,
      address: "Prinsengracht 10, Amsterdam",
      start_at: DateTime.new(2020, 9, 9, 7, 30, 0))
    french.end_at = french.start_at + 2.hours
    french.save!

    french = Feast.new(
      title: "Thursday Night Patisserie",
      description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes",
      meal_type: "Dessert",
      user: user,
      guest_limit: 3,
      price: 10,
      available: true,
      address: "Prinsengracht 10, Amsterdam",
      start_at: DateTime.new(2020, 9, 10, 7, 30, 0))
    french.end_at = french.start_at + 2.hours
    french.save!

    french = Feast.new(
      title: "Thursday Night Patisserie",
      description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes",
      meal_type: "Dessert",
      user: user,
      guest_limit: 3,
      price: 10,
      available: true,
      address: "Prinsengracht 10, Amsterdam",
      start_at: DateTime.new(2020, 9, 11, 7, 30, 0))
    french.end_at = french.start_at + 2.hours
    french.save!

  file1 = URI.open("https://source.unsplash.com/featured/?food, indian")
  file2 = URI.open("https://source.unsplash.com/featured/?food, cuban")
  file3 = URI.open("https://source.unsplash.com/featured/?food, food")
  file4 = URI.open("https://source.unsplash.com/featured/?food, picnic")
  file5 = URI.open("https://source.unsplash.com/featured/?food, french")

  indian.photo.attach(io: file1, filename: 'feast.jpg', content_type: 'image/jpg')
  cuban.photo.attach(io: file2, filename: 'feast.jpg', content_type: 'image/jpg')
  casual.photo.attach(io: file3, filename: 'feast.jpg', content_type: 'image/jpg')
  picnic.photo.attach(io: file4, filename: 'feast.jpg', content_type: 'image/jpg')
  french.photo.attach(io: file5, filename: 'feast.jpg', content_type: 'image/jpg')


  feast = [indian, cuban, casual, picnic, french]

  5.times do
  Reservation.create(number_of_guests: rand(0..5), status: "pending", user: user, feast: feast.sample)
  end

  # feasts.each_with_index do |feast, top_index|
  #   5.times.with_index do |index|
  #     reservation_user = User.new(first_name: "X", last_name: "Y", email: "a#{top_index}#{index}@a.com", password: 123456, bio:"Heyyy this is my bio I am cool and i like to eat and thats about it how are you", gender: ["female", "male"].sample)
  #     reservation_user.save
  #     Reservation.create(number_of_guests: rand(0..5), status: "pending", user: reservation_user, feast: feast)
  #   end
  # end


  # feast2.photo.attach(io: file2, filename: 'Cuabn food image', content_type: 'image/jpg')
  # feast3.photo.attach(io: file3, filename: 'Casual dining image', content_type: 'image/jpg')
  # feast4.photo.attach(io: file4, filename: 'Picnic image', content_type: 'image/jpg')
  # feast5.photo.attach(io: file5, filename: 'Patisserie image', content_type: 'image/jpg')

  # feast1.save!
  # feast2.save!
  # feast3.save!
  # feast4.save!
  # feast5.save!


puts "#{Feast.count} feasts created"
puts "#{User.count} users created"
puts "#{Reservation.count} reservations created"
puts "--------------------------"
puts "End time is #{Time.now}"
puts "--------------------------"
puts 'Finished!'
