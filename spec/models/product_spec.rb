require 'rails_helper'

RSpec.describe Product, :type => :model do
  context "object creation" do
    let(:product) { create(:product, name: name) }
    let(:name) { "simple-product" }

    it "tests correct correct properties from factory" do
      expect(product.name).to eq name
      expect(product.images.count).to eq 1 
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
    let(:product) { create(:product, base_price: base_price) }
    let(:addon) { create(:addon, value: base_addon, type: Addon::PERCENTAGE) }
    let(:addon_money) { create(:addon, value: money_value, type: Addon::MONEY) }
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
