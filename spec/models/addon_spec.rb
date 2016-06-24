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

  context 'document validation' do
    let(:addon) { build(:addon, type: "anything") }

    context 'wrong type' do
      it 'returns error' do
        addon.save
        expect(addon.valid?).not_to eq true
      end
    end

    context 'right type' do
      it 'returns error' do
        addon.type = Addon::MONEY
        addon.save
        expect(addon.valid?).to eq true
      end
    end
  end
end
