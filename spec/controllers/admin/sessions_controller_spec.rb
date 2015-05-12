require 'rails_helper'

RSpec.describe Admin::SessionsController, :type => :controller do
  describe "#login route" do
    it "does something" do
      get :login
      expect(response).to render_template("login")
    end
  end
end
