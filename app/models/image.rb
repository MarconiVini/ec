class Image
  include Mongoid::Document
  include Mongoid::Timestamps


  field :width,  :type => Integer
  field :height, :type => Integer
  field :orientation
  field :position, :type => Integer, :default => 0
  embedded_in :product

  # CarrierWave
  mount_uploader :file, ImageUploader
  validates_presence_of :file
end