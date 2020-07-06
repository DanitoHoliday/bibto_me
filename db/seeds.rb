# require "faker"

# Finder.destroy_all
# Tag.destroy_all
# User.destroy_all

puts ""
puts "Creating admin"
puts ""
x = User.create(first_name: "Timo", last_name: "Turner", email: "jan@bibto.me", password: "123456", phone: "+4915774307257", shared_phone: false)

puts "Admin-Name     | #{x.first_name} #{x.last_name}"
puts "Admin-Email    | #{x.email}"
puts "Admin-password | #{x.password}"
puts ""
# puts "creating already registered tags for Admin"
# puts ""

# tag = Tag.new(code: "abc123", registered: true,  category: "Phone", user_id: x.id)
# tag.save
# puts "Tag #1 created #{tag.category} ||  #{tag.code}"
# puts ""

# tag = Tag.new(code: "xyz123", registered: true,  category: "Bag", user_id: x.id)
# tag.save
# puts "Tag #2 created #{tag.category} ||  #{tag.code}"
# puts ""

# tag = Tag.new(code: "lwgn12", registered: true,  category: "Laptop", user_id: x.id)
# tag.save
# puts "Tag #3 created #{tag.category} ||  #{tag.code}"
# puts ""

# ######################

# puts "#################"
# puts ""
# sleep(1)
# puts "Creating more users"
# puts ""
# puts "#################"
# puts ""

# ######################

# leon = User.create(first_name: "Leon", last_name: "Entrup", email: "leon@bibto.me", password: "123456", phone: "+49 157 7430 7257", shared_phone: true)
# puts "#{leon.first_name} created"
# puts "shared_phone = #{leon.shared_phone}"
# puts""

# tag = Tag.new(code: "dev123", registered: true,  category: "Keys", user_id: leon.id)
# tag.save
# puts "Tag #1 created #{tag.category} ||  #{tag.code}"
# puts ""

# tag = Tag.new(code: "git123", registered: true,  category: "Phone", user_id: leon.id)
# tag.save
# puts "Tag #2 created #{tag.category} ||  #{tag.code}"
# puts ""

# tag = Tag.new(code: "lew123", registered: true,  category: "Bag", user_id: leon.id)
# tag.save
# puts "Tag #3 created #{tag.category} ||  #{tag.code}"
# puts ""

# puts ""
# puts "#################"
# puts ""

# tony = User.create(first_name: "Tony", last_name: "Panacek", email: "tony@bibto.me", password: "123456", phone: "+49 151 4444 4444", shared_phone: false)
# puts "#{tony.first_name} created"
# puts "shared_phone = #{tony.shared_phone}"
# puts ""

# tag = Tag.new(code: "usa123", registered: true,  category: "Bag", user_id: tony.id)
# tag.save
# puts "Tag #1 created #{tag.category} ||  #{tag.code}"
# puts ""

# tag = Tag.new(code: "ber123", registered: true,  category: "Phone", user_id: tony.id)
# tag.save
# puts "Tag #2 created #{tag.category} ||  #{tag.code}"
# puts ""

# tag = Tag.new(code: "cod123", registered: true,  category: "Keys", user_id: tony.id)
# tag.save
# puts "Tag #3 created #{tag.category} ||  #{tag.code}"
# puts ""

# puts ""
# puts "#################"
# puts ""

# ######################

# puts 'Creating 10 unregistered tags...'
# puts ""
# 10.times do |i|
#   i = Tag.create!(
#     code: SecureRandom.hex(3).downcase,
#     registered: false
#   )
#   puts "1 | unregistered tag created  -  #{i.code} "
#   puts
# end

puts "###########################"
puts "## Creating special tags ##"
puts "###########################"

tag = Tag.new(code: "xxxxxx", registered: false)
tag.save
tag = Tag.new(code: "a1b2c3", registered: false)
tag.save

puts "#### Presentation Tag  ####"
puts "###########################"
puts "##### xxxxxx created ######"
puts "##### a1b2c3 created ######"
puts "###########################"

# puts ""
# puts "INSTRUCTION PLEASE READ !!!"
# puts ""
# puts "PLEASE ONLY USE   user@bibto.me   as your primary login"
# puts ""
# puts "Admin and Leon have shared_phone TRUE ... Toni has shared_phone FALSE"
# puts "Please use the tags from Leon and Toni for RETURN test"
# puts "Use unregistered tags to REGISTER"
# puts ""
# puts "Happy developing :)"

# tag = Tag.new(code: "xxxxxx", registered: false)
# tag.save
# tag = Tag.new(code: "a1b2c3", registered: false)
# tag.save

# puts "#### Presentation Tag  ####"
# puts "###########################"
# puts "##### xxxxxx created ######"
# puts "##### a1b2c3 created ######"
# puts "###########################"

# 500.times {
#   puts "Creating tag",
#   Tag.create
#   puts "Tag created"
# }
