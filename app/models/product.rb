class Product
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  #attr_accessor :image#, :images

  field :name, type: String
  slug :name
  embeds_many :images, cascade_callbacks: true, class_name: 'Image'

end