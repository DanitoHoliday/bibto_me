require "faker"

Tag.destroy_all
User.destroy_all
puts ""
puts "Creating admin"
puts ""
x = User.create(first_name: "Armin", last_name: "Admin", email: "user@bibto.me", password: "123456", phone: "+49 151 1337 1338", shared_phone: true)

puts "Admin-Name | #{x.first_name} #{x.last_name}"
puts "Admin-Email    | #{x.email}"
puts "Admin-password | #{x.password}"
puts ""
puts "creating already registered tag for Admin"
puts ""

tag = Tag.new(code: "ABC123", registered: true,  category: "Sticker", user_id: x.id)
tag.save
puts "Tag #1 created #{tag.category} ||  #{tag.code}"
puts ""

tag = Tag.new(code: "XYZ123", registered: true,  category: "Keychain", user_id: x.id)
tag.save
puts "Tag #2 created #{tag.category} ||  #{tag.code}"
puts ""

tag = Tag.new(code: "A1B2C3", registered: true,  category: "Tag", user_id: x.id)
tag.save
puts "Tag #3 created #{tag.category} ||  #{tag.code}"
puts ""

######################

puts "#################"
puts ""
sleep(1)
puts "Creating more users"
puts ""
puts "#################"
puts ""

######################

leon = User.create(first_name: "Leon", last_name: "Entrup", email: "leon@bibto.me", password: "123456", phone: "+49 151 3333 3333", shared_phone: true)
puts "#{leon.first_name} created"
puts "shared_phone = #{leon.shared_phone}"
puts""

tag = Tag.new(code: "DEV123", registered: true,  category: "Sticker", user_id: leon.id)
tag.save
puts "Tag #1 created #{tag.category} ||  #{tag.code}"
puts ""

tag = Tag.new(code: "GIT123", registered: true,  category: "Keychain", user_id: leon.id)
tag.save
puts "Tag #2 created #{tag.category} ||  #{tag.code}"
puts ""

tag = Tag.new(code: "LEW123", registered: true,  category: "Tag", user_id: leon.id)
tag.save
puts "Tag #3 created #{tag.category} ||  #{tag.code}"
puts ""

puts ""
puts "#################"
puts ""

tony = User.create(first_name: "Tony", last_name: "Panacek", email: "tony@bibto.me", password: "123456", phone: "+49 151 4444 4444", shared_phone: false)
puts "#{tony.first_name} created"
puts "shared_phone = #{tony.shared_phone}"
puts ""

tag = Tag.new(code: "USA123", registered: true,  category: "Sticker", user_id: tony.id)
tag.save
puts "Tag #1 created #{tag.category} ||  #{tag.code}"
puts ""

tag = Tag.new(code: "BER123", registered: true,  category: "Keychain", user_id: tony.id)
tag.save
puts "Tag #2 created #{tag.category} ||  #{tag.code}"
puts ""

tag = Tag.new(code: "COD123", registered: true,  category: "Tag", user_id: tony.id)
tag.save
puts "Tag #3 created #{tag.category} ||  #{tag.code}"
puts ""

puts ""
puts "#################"
puts ""

######################

puts 'Creating 20 unregistered tags...'
puts ""
20.times do |i|
  i = Tag.create!(
    code: Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 3, min_numeric: 3),
    registered: false
  )
  puts "1 | unregistered tag created  -  #{i.code} "
  puts
end
