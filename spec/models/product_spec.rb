require 'rails_helper'

RSpec.describe Product, :type => :model do
  context "object creation" do
    let(:product) { create(:product, name: name) }
    let(:name) { "simple-product" }
    it "tests correct correct properties from factory" do
      expect(product.name).to eq name
      expect(product.images.count).to eq 1 
    end
  end
end
