require "open-uri"
# require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts 'Creating feasts...'

puts "Start time is #{Time.now}"
puts "--------------------------"
Feast.destroy_all
User.destroy_all
Reservation.destroy_all

puts 'Creating a fake user...'
file1 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599472451/Avatar_Camila_2020_m3x0hw.jpg')
file2 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599727520/david_elltq6.jpg')
file3 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599727534/essam_tidfkh.jpg')
file4 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599742870/48361006_10156660642505353_3091004636270690304_n_vyleaz.jpg')
file5 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599657413/ilx6auwz8w693f3luc7lkz23g7n8.jpg')
file6 = URI.open('https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599731022/anna_1_iyvmtj.jpg')

user1 = User.create(first_name: "Camila", last_name: "Miorelli", email: "cami@gmail.com", password: 123456, bio:"Hey! I just moved to Amsterdam from Miami, I am looking to make new friends and try some delicious food. My interests include museums, cooking, rollerskating, and watching films. I am vegetarian and i'm looking to connect with other veggie friends.", gender: "female", admin: false)
user2 = User.create(first_name: "David", last_name: "Lusztig", email: "david@gmail.com", password: 123456, bio:"Hello. I have been living in Rotterdam for the past year. Usually I love going out to new restaurants and trying interesting foods, but I want to get into cooking again. I would love to host some dinners at my house and share my cooking hobby with all of you. I am a vegetarian so I make a variety of veggie meals.", gender: "male", admin: true)
user3 = User.create(first_name: "Essam", last_name: "Dawood", email: "essam@gmail.com", password: 123456, bio:"What's Up? I have been living in The Netherlands for a while, but I am hoping to meet some new people. I just switched jobs recently and having been looking for new ways to connect. I love burgers! I like to cook AND eat. Let's see what's out there!", gender: "male", admin: false)
user4 = User.create(first_name: "Hans", last_name: "Preeker", email: "hans@gmail.com", password: 123456, bio:"Hoi! Mijn name is Hans. Haha, I meant my name is Hans for all you non-Dutchies ; ). I used to be a professional chef, but nowadays i'm a coder. I still love to cook and challenge myself with new dishes and guests. I hope to invite people into my home and introduce them to some Dutch hospitality.", gender: "male", admin: false)
user5 = User.create(first_name: "Maria", last_name: "Diaz", email: "maria@gmail.com", password: 789101, bio:"Hola! I would love to cook some Cuban food with people in Amsterdam and share my story and food with all of you.", gender: "female", admin: false)
user6 = User.create(first_name: "Anna", last_name: "Bergman", email: "anna@gmail.com", password: 789101, bio:"I love to eat, but I don't love to cook. I still love to host thought and I would like to meet new and interesting people. I am a dancer and an artist. Let's chat!", gender: "female", admin: false)

user1.photo.attach(io: file1, filename: 'camila.jpg', content_type: 'image/jpg')
user2.photo.attach(io: file2, filename: 'camila.jpg', content_type: 'image/jpg')
user3.photo.attach(io: file3, filename: 'camila.jpg', content_type: 'image/jpg')
user4.photo.attach(io: file4, filename: 'camila.jpg', content_type: 'image/jpg')
user5.photo.attach(io: file5, filename: 'camila.jpg', content_type: 'image/jpg')
user6.photo.attach(io: file6, filename: 'camila.jpg', content_type: 'image/jpg')

# ADDRESSES=["Reguliersgracht 17, Amsterdam", "Prinsengracht 10, Amsterdam", "Pannekoekstraat 110, Rotterdam", "Kelderwindkade 15, Haarlem", "Ijsbaanpad 9, Amsterdam"]
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
  puts "Start creating feasts"

    veggie = Feast.new(
      title: "Vegetarian Gnocci Dinner",
      description: "I am looking to make my favorite dish for dinner, homemade Gnocci with pesto and greens. This meal is vegetarian approved and delicious! Please bring some wine.",
      user: user4,
      meal_type: "Vegetarian",
      guest_limit: 4,
      price_cents: 1200,
      available: true,
      address: "Pannekoekstraat 110, Rotterdam",
      start_at: DateTime.new(2020, 11, 9, 19, 00, 0))
    veggie.end_at = veggie.start_at + 2.hours
    veggie.save!
    puts "Veggie feast created"

    cuban = Feast.new(
      title: "Maria's Lechon",
      description: "I will be making lechon asado for new friends!",
      user: user5,
      meal_type: "Meat dish",
      guest_limit: 3,
      price_cents: 2000,
      available: true,
      address: "Baars 14, Oostzaan",
      start_at: DateTime.new(2020, 11, 11, 21, 00, 0))
    cuban.end_at = cuban.start_at + 2.hours
    cuban.save!
    puts "Cuban feast created"

    casual = Feast.new(
      title: "Casual Friday Tapas",
      description: "Hey everyone! I'm not so great at cooking, but I would love to host some tapas at my house. I will order a mixture of vegetarian and meat dishes we can all share. See you there!",
      user: user6,
      meal_type: "Ominivore's Delight",
      guest_limit: 10,
      price_cents: 1000,
      available: true,
      address: "Laan 1, Schiedam",
      start_at: DateTime.new(2021, 1, 1, 16, 0, 0))
    casual.end_at = casual.start_at + 2.hours
    casual.save!
    puts "Casual feast created"

    picnic = Feast.new(
      title: "Sunday Picnic at Vondel",
      description: "Looking to connect with people interested in design and vegan food. I would like to host a picnic in the park by the lake, everyone can bring some vegan snacks.",
      user: user5,
      meal_type: "vegan",
      guest_limit: 20,
      price_cents: 800,
      available: true,
      address: "Vondelpark, Amsterdam",
      start_at: DateTime.new(2020, 10, 10, 15, 30, 0))
    picnic.end_at = picnic.start_at + 2.hours
    picnic.save!
    puts "Picnic feast created"

    french = Feast.new(
      title: "Thursday Night Patisserie",
      description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes, I hope you have a sweet tooth!",
      meal_type: "Dessert",
      user: user4,
      guest_limit: 3,
      price_cents: 1200,
      available: true,
      address: "Gedempte Gracht 1, Zaandam",
      start_at: DateTime.new(2020, 11, 10, 7, 30, 0))
    french.end_at = french.start_at + 2.hours
    french.save!
    puts "French feast created"

    dutch = Feast.new(
      title: "Authentic Dutch Dinner",
      description: "I will making a classic Dutch meal. As the weather gets colder I want to make some erwtensoep, which is a pea soup with pork and I will be baking my own bread. I know you will all love it.",
      meal_type: "Dinner/Non-vegetarian",
      user: user2,
      guest_limit: 5,
      price_cents: 1000,
      available: true,
      address: "Prinsengracht 10, Amsterdam",
      start_at: DateTime.new(2020, 10, 10, 18, 30, 0))
    dutch.end_at = dutch.start_at + 3.hours
    dutch.save!
    puts "Dutch feast created"


  file1 = URI.open("https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599728871/pexels-sebastian-coman-photography-3590401_lulz8x.jpg")
  file2 = URI.open("https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599729305/cuban_food_lgr9li.jpg")
  file3 = URI.open("https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051858/pexels-lina-kivaka-1813504_y5wntr.jpg")
  file4 = URI.open("https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599729766/pexels-taryn-elliott-4374575_1_u6m2g3.jpg")
  file5 = URI.open("https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599051937/pexels-flat-hito-863014_txyjpr.jpg")
  file6 = URI.open("https://res.cloudinary.com/dpqkzfvuf/image/upload/v1599728164/ErwtensoepSnelkookpan-1610x1080_fdgy70.jpg")

  veggie.photo.attach(io: file1, filename: 'feast.jpg', content_type: 'image/jpg')
  cuban.photo.attach(io: file2, filename: 'feast.jpg', content_type: 'image/jpg')
  casual.photo.attach(io: file3, filename: 'feast.jpg', content_type: 'image/jpg')
  picnic.photo.attach(io: file4, filename: 'feast.jpg', content_type: 'image/jpg')
  french.photo.attach(io: file5, filename: 'feast.jpg', content_type: 'image/jpg')
  dutch.photo.attach(io: file6, filename: 'feast.jpg', content_type: 'image/jpg')

  feast = [veggie, cuban, casual, picnic, french, dutch]
  user = [user1, user2, user3, user4, user5, user6]

  # 5.times do
  # Reservation.create(number_of_guests: rand(0..3), status: "Pending", user: user.sample, feast: feast.sample)
  # end

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
