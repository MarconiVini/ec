require 'rails_helper'

RSpec.describe Admin::LinksHelper, :type => :helper do
  let(:hash_link) { {"Dashboard"=>"admin_dashboard_path", "Configurações"=>""} }
  let(:hash_test) { {"test" => {"Dashboard"=>"admin_dashboard_path", "Configurações"=>""}} }
  let(:call_request) { "/admin/dashboard" }

  describe "executes correctly" do
    before(:each) do
      allow(YAML).to receive(:load_file).and_return(hash_test)
      allow(request).to receive(:path).and_return(call_request)
    end

    it "builds li structure for the admin interface" do
      expect(build_links("test").class).to eq ActiveSupport::SafeBuffer 
      expect(build_links("test")).to include(call_request) 
    end
    it "returns # when no link is supplied" do
      expect(build_links("test")).to include("#") 
    end
  end
end

