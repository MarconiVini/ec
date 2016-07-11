require 'rails_helper'

RSpec.describe Product, :type => :model do
  context "object creation" do
    let(:product) { create(:product, name: name) }
    let(:name) { "simple-product" }

    it "tests correct correct properties from factory" do
      expect(product.name).to eq name
      expect(product.images.count).to eq 1 
    end

    context "fields types" do
      describe 'base_price' do
        let(:product) { build(:product, base_price_string: valid_base_price) }
        let(:product_zero_base_price) { build(:product, base_price_string: "") }
        let(:base_price) { 44.99 }
        let(:valid_base_price) { "R$ 44,99" }
        it 'saves if .2f' do
          product.save
          expect(product.base_price).to eq base_price
        end

        it 'does not save if base_price is zero' do
          expect(product_zero_base_price.save).to eq false
        end
      end
    end


    context 'validation' do
      describe 'base price' do
        let(:product) { build(:product, base_price_string: "") }
        it 'is required' do
          expect(product.save).to eq false
          expect(product.errors.keys.first).to eq :base_price_string
        end

        it 'saves when product base_price_string is supplied' do
          product.base_price_string = "R$ 30.99"
          expect(product.save).to eq true  
        end
      end       
    end 

    describe '#images_url' do
      let(:product_with_images) { create(:product_with_images, image_names: image_names) }
      let(:image_names) { ["img1.jpg", "img2.jpg"] }
      it 'recovers all images urls' do
        image_names.each do |image_name|
          file_name = product_with_images.images_url.find{|i| i =~ /#{image_name}/ }
          expect(file_name).to include(image_name)
        end
      end
    end
  end

  describe '.addon_sum' do
    let(:product) { create(:product) }
    let(:addon) { create(:addon) }

    it 'sums up addon' do
      product.addon_sum addon
      expect(product.addons.count).to eq 1
      expect(product.addons.first).to eq addon
    end
  end

  context 'with addons' do
    let(:product) { create(:product, base_price_string: base_price_string) }
    let(:addon) { create(:addon, value: base_addon, type: Addon::PERCENTAGE) }
    let(:addon_money) { create(:addon, value: money_value, type: Addon::MONEY) }
    let(:base_price_string) { "R$ #{base_price}" }
    let(:base_price) { 100 }
    let(:base_addon) { 10 }
    let(:money_value) { 14 }

    it 'can sum-up an addon percentage into price' do
      product.addon_sum(addon)
      expect(product.price).to eq(base_price + base_price * (base_addon / 100.0))
    end

    it 'can sum-up an addon money into price' do
      product.addon_sum(addon_money)
      expect(product.price).to eq(base_price + money_value)
    end

    it 'can sum-up an addon money and percentage into price' do
      product.addon_sum(addon_money)
      product.addon_sum(addon)

      expect(product.price).to eq(base_price + money_value + base_price * (base_addon / 100.0))
    end
  end
end
