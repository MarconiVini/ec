class Product
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Timestamps

  attr_accessor :base_price_string

  field :name, type: String
  slug :name

  field :base_price, type: Float
  field :price
  field :stock
  #addons is a sum of all values that change current base_price
  field :addons, type: Array, default: []


  validates :base_price, presence: true
  before_validation :save_base_price, :check_price_is_not_null
  before_save :update_price


  embeds_many :images, cascade_callbacks: true, class_name: 'Image'

  def addon_sum(addon)
    addons.push(addon)
    update_price
  end

  def images_url
    self.images.collect{|i| i.file.url }
  end

  protected
    #removes the "R$"" from price and changes "," to "." for the float price
    def save_base_price
      if self.base_price_string != nil && self.base_price_string.class == String 
        self.base_price_string.slice!("R$ ")
        self.base_price = self.base_price_string.gsub(".", "").gsub(",", ".").to_f
      end
    end

    def check_price_is_not_null
      if self.base_price == 0.0
        self.errors.add(:base_price_string, "Valor do preço base não pode ser 0.0")
        return false
      end 
    end

    def update_price
      prices_to_add = addons.map do |a|
        if a.type == Addon::PERCENTAGE
          (base_price * (a.value/100.0)).round(2) 
        else
          a.value
        end
      end
      add_price = prices_to_add.empty? ? 0 : prices_to_add.reduce(:+)
      self.price = (base_price + add_price).round(2)
    end
end