require 'rails_helper'

RSpec.describe Admin::AdminsController, :type => :controller do
  tests Devise::SessionsController
  include Devise::TestHelpers

  let!(:admin) { create(:admin) }
  
  before(:each) { login(admin) }

  describe "#index" do
    subject { get :index }
    
    it "requests all admins" do
      subject
      expect(assigns(:admins)).to eq [admin]
    end

    context "when with a lot of admins" do
      let!(:admin_list) { create_list(:admin, 10) }

      it "paginates all admins showing only part of it" do
        subject
        expect(assigns(:admins).to_a.count).to eq admin_list.count 
      end
    end
  end

  describe "#edit" do
    subject { get :edit, id: admin.id }
    it "reaches the edit pages" do
      subject
    end
  end
end
