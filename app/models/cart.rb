class Cart
  
  attr_accessor :products, :session_hash

  def initialize(cart)
    to_products(cart)
    @session_hash = cart
  end

  def add_item(id)
    if(session_hash[id].nil?)
      session_hash[id] = 1
    else
      session_hash[id] += 1
    end

    to_products(session_hash)
  end

  def to_session
    session_hash ||= { }

    products.each do |key, value|
      session_hash[key.id.to_s] = value
    end

    session_hash
  end

  private

  def to_products(cart)
    @products ||= { }

    cart.each do |key, value|
      @products[Product.find(key)] = value
    end
  end
end