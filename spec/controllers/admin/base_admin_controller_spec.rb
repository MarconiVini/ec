require 'rails_helper'

RSpec.describe Admin::BaseAdminController, :type => :controller do
  include Devise::TestHelpers

  let!(:admin) { create(:admin) }

  describe "before_action#check_admin_is_logged_in" do
    context "Admin is not logged in" do
      controller do 
        def index
          
        end
        def set_header
          
        end
      end

      it "redirects user to login page" do
        get :index
        expect(response.status).to eq 302
        expect(response).to redirect_to(new_admin_session_path)
      end
    end

    context "Admin is logged in" do
      before(:each) do
        login(admin)
      end
      it "redirects user to login page" do
        expect(subject.current_admin).to eq admin
      end
    end
  end
end
