FactoryGirl.define do
  factory :cart do
    initialize_with { new({ }) }    
  end
end
