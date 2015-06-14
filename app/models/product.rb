class Product
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  field :name, type: String
  slug :name
end