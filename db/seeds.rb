require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts 'Creating feasts...'

puts "Start time is #{Time.now}"
puts "--------------------------"
Feast.destroy_all
User.destroy_all
Reservation.destroy_all

puts 'Creating a fake user...'
user = User.create(first_name: "Camila", last_name: "Miorelli", email: "a@a.com", password: 123456, bio:"Heyyy this is my bio I am cool and i like to eat and thats about it how are you", gender: "female")



5.times do

  file1 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051861/lior-shapira-GKxsKNTfZd8-unsplash_xojphr.jpg')
  file2 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051859/quimbombo_nkrlhv.jpg')
  file3 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051858/pexels-lina-kivaka-1813504_y5wntr.jpg')
  file4 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051856/pexels-taryn-elliott-4374575_bz4rxt.jpg')
  file5 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051937/pexels-flat-hito-863014_txyjpr.jpg')

  indian = Feast.new(title: "Traditional Indian Cuisine", description: "I would like to invite everyone to my traditional indian feast.
  I am from the punjabi region of India and I would like to make a curry and have some friends over. The meal will be vegetarian friendly
  and also very spicy! Hope to meet you all soon.", user: user,  meal_type: "Vegetarian", guest_limit: 5, price: 14, available: true, address: "Reguilersgracht 17, Amsterdam", start_at:(DateTime.new), end_at:(DateTime.new), photo: "https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051861/lior-shapira-GKxsKNTfZd8-unsplash_xojphr.jpg")
  indian.save!

  cuban = Feast.new(title: "Camila's Lechon", description: "I will be making lechon asado for new friends!", user: user, meal_type: "Meat dish", guest_limit: 8, price: 20, available: true, address: "Gerard Doustraat 22, Amsterdam", start_at:(DateTime.new), end_at:(DateTime.new), photo: "https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051859/quimbombo_nkrlhv.jpg")
  cuban.save!

  casual = Feast.new(title: "Casual Friday Tapas", description: "Hey everyone, I'm not so great at cooking, but I would love to host some tapas at my house, i'll order a mixture of vegetarian and meat dishes,", user: user, meal_type: "Ominivore's Delight", guest_limit: 15, price: 10, available: true, address: "Ijsbaanpad 8, Amsterdam", start_at:(DateTime.new), end_at:(DateTime.new), photo: "https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051858/pexels-lina-kivaka-1813504_y5wntr.jpg")
  casual.save!

  picnic = Feast.new(title: "Sunday Picnic at Vondel", description: "Looking to connect with people interested in design and vegan food, I would like to host a picnic in the park, everyone can bring some vegan snacks.", user: user, meal_type: "vegan", guest_limit: 25, price: 0, available: true, address: "Vondel Park, Amsterdam", start_at:(DateTime.new), end_at:(DateTime.new), photo: "https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051856/pexels-taryn-elliott-4374575_bz4rxt.jpg")
  picnic.save!

  french = Feast.new(title: "Thursday Night Patisserie", description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes", meal_type: "Dessert", user: user, guest_limit: 3, price: 10, available: true, address: "Prinsengracht 10, Amsterdam", start_at:(DateTime.new), end_at:(DateTime.new), photo: "https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051937/pexels-flat-hito-863014_txyjpr.jpg")
  french.save!

  feasts = [indian, cuban, casual, picnic, french]

  feasts.each_with_index do |feast, top_index|
    5.times.with_index do |index|
      reservation_user = User.new(first_name: "X", last_name: "Y", email: "a#{top_index}#{index}@a.com", password: 123456, bio:"Heyyy this is my bio I am cool and i like to eat and thats about it how are you", gender: ["female", "male"].sample)
      reservation_user.save
      Reservation.create(number_of_guests: rand(0..5), status: "pending", user: reservation_user, feast: feast)
    end
  end

  feast1.photo.attach(io: file1, filename: 'Indian feast image', content_type: 'image/png')
  feast2.photo.attach(io: file2, filename: 'Cuabn food image', content_type: 'image/png')
  feast3.photo.attach(io: file3, filename: 'Casual dining image', content_type: 'image/png')
  feast4.photo.attach(io: file4, filename: 'Picnic image', content_type: 'image/png')
  feast5.photo.attach(io: file5, filename: 'Patisserie image', content_type: 'image/png')

  feast1.save!
  feast2.save!
  feast3.save!
  feast4.save!
  feast5.save!
end


puts "#{Feast.count} feasts created"
puts "#{User.count} users created"
puts "--------------------------"
puts "End time is #{Time.now}"
puts "--------------------------"
puts 'Finished!'
