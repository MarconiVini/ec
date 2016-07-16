require 'factory_girl_rails'
require 'find'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#########
# Destroy all images in dev environment to clean up bucket
#########
s3 = Fog::Storage::AWS.new( provider:'AWS',aws_access_key_id:'AKIAJESVXJZDSTWPF4XQ',aws_secret_access_key:'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',region:'sa-east-1')

s3.directories.get("ecmatrixbucket").files.each do |file|
  p "Destroyed file: #{file.key}"
  file.destroy unless file == :EOF
end
#########
# END
#########

#########
# Create default admin user 
#########
u = Admin.new({name: "Marcos", email: "cardosounicamp@gmail.com", password: "12345678", 
      password_confirmation: "12345678"})
puts "Admin: #{u.name}, salvo com sucesso!!" if u.save!
#########
# END
#########
#########
# Fill all images for database Products
#########
image_dir = "#{Dir.pwd}/db/seed images"

counter = 1

Find.find(image_dir) do |dir| 
  next unless(dir != image_dir && File.directory?(dir))

  product = FactoryGirl.build(:product)

  Find.find(dir) do |image|
    next if(File.directory?(image))
    file = Rack::Test::UploadedFile.new(image, "image/jpeg")
    product.images << Image.new(file: file)
  end

  puts "Product No #{counter}: #{product.name} with price: #{product.base_price}" if product.save
  counter += 1
end
#########
# END
#########
