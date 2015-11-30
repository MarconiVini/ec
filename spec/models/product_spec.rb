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
end
