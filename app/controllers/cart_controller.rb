class CartController < ApplicationController
  def index

  end

  def add_item
    #initialize cart function
    cart = session[:cart] ||= { }
    Cart.new(cart)
  end
end
