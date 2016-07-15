require 'factory_girl_rails'
require 'find'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



u = Admin.new({name: "Marcos", email: "cardosounicamp@gmail.com", password: "12345678", 
      password_confirmation: "12345678"})
puts "Admin: #{u.name}, salvo com sucesso!!" if u.save!

#fill all images for database Products
image_dir = "#{Dir.pwd}/db/seed images"

Find.find(image_dir) do |dir| 
  next unless(dir != image_dir && File.directory?(dir))

  product = FactoryGirl.build(:product)

  Find.find(dir) do |image|
    next if(File.directory?(image))
    file = Rack::Test::UploadedFile.new(image, "image/jpeg")
    product.images << Image.new(file: file)
  end

  puts "Product: #{product.name} with price: #{product.base_price}" if product.save
end

