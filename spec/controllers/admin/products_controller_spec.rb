require 'rails_helper'

RSpec.describe Admin::ProductsController, :type => :controller do
  include Devise::TestHelpers

  let!(:admin) { create(:admin) }
  
  before(:each) { login(admin) }
  
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET create" do
    let(:product) { {product: attributes_for(:product)} }
    it "returns http success" do
      post :create, product
      expect(response).to be_success
    end
  end


  describe "GET show" do
    let(:product) { create(:product) }
    it "returns http success" do
      get :show, id: product.slug
      expect(response).to be_success
    end
  end

  describe "GET destroy" do
    let!(:product) { create(:product) }
    let(:deletion) { delete :destroy, id: product.slug }
    it "returns http success" do
      expect{ deletion }.to change{Product.count}.from(1).to(0)
    end
  end

  describe "GET edit" do
    let(:product) { create(:product) }
    it "returns http success" do
      get :edit, id: product.slug
      expect(response).to be_success
    end
  end
end
