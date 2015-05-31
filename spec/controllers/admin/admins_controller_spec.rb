require 'rails_helper'

RSpec.describe Admin::AdminsController, :type => :controller do
  tests Devise::SessionsController
  include Devise::TestHelpers

  let!(:admin) { create(:admin) }

  describe "#index" do
    subject { get :index }
    it "requests all admins" do
      subject
    end
  end

end
