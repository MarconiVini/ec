require 'rails_helper'

RSpec.describe Addon, :type => :model do
  context "object creation" do
    let(:addon) { create(:addon, name: name) }
    let(:name) { "discont 20%" }

    it "tests correct correct properties from factory" do
      expect(addon.name).to eq name
    end
  end

  context 'to be used by other object' do
    let(:addon) { create(:addon) }
    
    it 'returns only required fields for product calculation' do
      expect(addon.for_product_params).to eq({ id: addon.id, type: addon.type, value: addon.value })
    end
  end
end
