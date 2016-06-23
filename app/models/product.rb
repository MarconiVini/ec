class Product
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  field :name, type: String
  slug :name

  field :base_price
  field :price
  field :stock

  #addons is a sum of all values that change current base_price
  field :addons, type: Array, default: []


  embeds_many :images, cascade_callbacks: true, class_name: 'Image'

  def addon_sum(addon)
    addons.push(addon)
    update_price
  end

  def images_url
    self.images.collect{|i| i.file.url }
  end

  protected
    def update_price
      prices_to_add = addons.map do |a|
        if a.type == Addon::PERCENTAGE
          (base_price * (a.value/100.0)).round(2) 
        else
          a.value
        end
      end
      self.price = (base_price + prices_to_add.reduce(:+)).round(2)
    end
end