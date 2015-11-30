FactoryGirl.define do
  factory :product do
    name        { Faker::Commerce.product_name }
    
    initialize_with do
      product = Product.new(
        name: Faker::Commerce.product_name  
      )
      product.images << FactoryGirl.build(:image)
      product
    end
    
    factory :product_with_images do

      initialize_with do
        product = Product.new(
          name: Faker::Commerce.product_name  
        )
        image_names.each do |i|
          product.images << FactoryGirl.build(:image, file_name: i)
        end
        product
      end

      transient do
        image_names ["test-image.jpg", "test-image2.jpg"]
      end
    end
  end

end
