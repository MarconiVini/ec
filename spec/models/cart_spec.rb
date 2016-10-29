require 'rails_helper'

RSpec.describe Cart, :type => :model do
  context "object creation" do
    let(:empty_cart)  { build(:cart) }
    
    it "creates proper object" do
      expect(empty_cart).not_to be_falsey
    end
  end

  context 'session with products' do
    let(:product)     { create(:product) }
    let(:product_two) { create(:product) }
    
    let(:cart_one_product) do  
      Cart.new({product.id.to_s => 1})
    end

    let(:cart_two_of_same_product) do  
      Cart.new({product.id.to_s => 3})
    end

    let(:cart_with_two_products) do
      Cart.new({ product_two.id.to_s => 4, product.id.to_s => 2 })
    end

    it 'returns hash with the product' do
      expect(cart_one_product.products).to eq({ product => 1 })
      expect(cart_one_product.products.first[0]).to eq product
    end
    
    it 'returns hash with the product quantity right' do
      expect(cart_two_of_same_product.products).to eq({ product => 3 })
    end

    it 'returns hash with two products' do
      expect(cart_with_two_products.products.count).to eq 2
    end

    it 'returns right count values' do
      expect(cart_with_two_products.products[product]).to eq 2
      expect(cart_with_two_products.products[product_two]).to eq 4
    end
  end

  describe '#to_session' do
    let(:product)     { create(:product) }
    let(:product_two) { create(:product) }
    let(:hash) { { product_two.id.to_s => 1, product.id.to_s => 4 } }
    let(:cart) do  
      Cart.new(hash)
    end

    context 'when we want to store session on the returning cookie to user' do
      it 'returns hash with ID and quantity' do
        expect(cart.to_session).to eq(hash)
      end
    end
  end
end
