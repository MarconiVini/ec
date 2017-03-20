class CartController < ApplicationController
  before_action :set_cart

  attr_accessor :products, :cart

  def index

  end

  def add_item
    
  end
  
  private

  def set_cart
    @cart = Cart.new(session[:cart])
    @products = @cart.products
  end
end
