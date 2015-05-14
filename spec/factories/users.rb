FactoryGirl.define do
  random_password = Faker::Internet.password
  factory :user do
    name        { Faker::Name.name }
    email       { Faker::Internet.email }
    password    { random_password } 
    password_confirmation { random_password } 
  end
end
