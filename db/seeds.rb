# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "faker"


Tag.destroy_all
User.destroy_all

puts "Creating admin"

x = User.create(first_name: "Armin", last_name: "Admin", email: "admin@gmail.com", password: "123456", phone: "+49 151 1337 1338", shared_phone: true)

puts "Admin-Name | #{x.first_name} #{x.last_name}"
puts "Admin-Email    | #{x.email}"
puts "Admin-password | #{x.password}"

puts "creating an already registered tag for Admnin"

  tag = Tag.new(code: "aa111", registered: true,  category: "Sticker", user_id: x.id)
  tag.save
  puts "Tag for admin created"

######################

puts "..."
puts "Creating more users"

######################

andy = User.create(first_name: "Andy", last_name: "Baranov", email: "andy@gmail.com", password: "123456", phone: "+49 151 1111 1111", shared_phone: true)
puts "#{andy.first_name} created"

ryan = User.create(first_name: "Ryan", last_name: "Kretch", email: "ryan@gmail.com", password: "123456", phone: "+49 151 2222 2222", shared_phone: true)
puts "#{ryan.first_name} created"

leon = User.create(first_name: "Leon", last_name: "Entrup", email: "leon@gmail.com", password: "123456", phone: "+49 151 3333 3333", shared_phone: true)
puts "#{leon.first_name} created"

tony = User.create(first_name: "Tony", last_name: "Panacek", email: "tony@gmail.com", password: "123456", phone: "+49 151 4444 4444", shared_phone: true)
puts "#{tony.first_name} created"

kaylin = User.create(first_name: "Kaylin", last_name: "Bittner", email: "kaylin@gmail.com", password: "123456", phone: "+49 151 5555 5555", shared_phone: true)
puts "#{kaylin.first_name} created"


######################

puts 'Creating 50 unregistered tags...'
50.times do |i|
  tag = Tag.create!(
    code: Faker::Alphanumeric.alphanumeric(number: 5),
    registered: false
  )
  puts "Tag #{tag.code} created"
end


