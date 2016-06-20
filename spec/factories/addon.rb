FactoryGirl.define do
  factory :addon do
    name { Faker::Book.title }
    description { Faker::Book.title }
    type { Addon::PERCENTAGE }
    value { 20 }
  end
end
