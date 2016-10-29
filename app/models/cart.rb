class Cart
  
  attr_accessor :products

  def initialize(cart)
    @products ||= { }

    cart.each do |key, value|
      @products[Product.find(key)] = value
    end
  end

  def to_session
    session ||= { }

    products.each do |key, value|
      session[key.id.to_s] = value
    end

    session
  end
end