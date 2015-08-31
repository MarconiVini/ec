FactoryGirl.define do
  factory :product do
    #name        { Faker::Commerce.product_name }
    
    initialize_with do
      product = Product.new(
        name: Faker::Commerce.product_name  
      )
      product.images << FactoryGirl.build(:image)
      product
    end
  end
end
