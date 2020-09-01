# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts 'Creating feasts...'

puts 'Creating a fake users...'
user = User.create(first_name: "Camila", last_name: "M", email: "a@a.com", password: 123456)

5.times do
indian = Feast.new
(title: "Traditional Indian Cuisine", description: "I would like to invite everyone to my traditional indian feast.
I am from the punjabi region of India and I would like to make a curry and have some friends over. The meal will be vegetarian friendly
and also very spicy! Hope to meet you all soon.", meal_type: "Vegetarian", guest_limit: 5, price: 14, available: true, address: "Reguilersgracht 17, Amsterdam")
indian.save!

cuban = Feast.new
(title: "Camila's Lechon", description: "I will be making lechon asado for new friends!", meal_type: "Meat dish", guest_limit: 8, price: 20, available: true, address: "Gerard Doustraat 22, Amsterdam")
cuban.save!

casual = Feast.new
(title: "Casual Friday Tapas", description: "Hey everyone, I'm not so great at cooking, but I would love to host some tapas at my house, i'll order a mixture of vegetarian and meat dishes,", meal_type: "Ominivore's Delight", guest_limit: 15, price: 10, available: true, address: "Ijsbaanpad 8, Amsterdam")
casual.save!

picnic = Feast.new
(title: "Sunday Picnic at Vondel", description: "Looking to connect with people interested in design and vegan food, I would like to host a picnic in the park, everyone can bring some vegan snacks.", meal_type: "vegan", guest_limit: 25, price: 0, available: true, address: "Vondel Park, Amsterdam")
picnic.save!

french = Feast.new
(title: "Thursday Night Patisserie", description: "I am an amateur pastry chef, I love to practice my skills with small cakes and madelienes", meal_type: "Dessert", guest_limit: 3, price: 10, available: true, address: "Prinsengracht 10, Amsterdam")
french.save!
end

puts 'Finished!'
