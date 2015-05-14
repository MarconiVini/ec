require 'rails_helper'

RSpec.describe Admin::SessionsController, :type => :controller do
  tests Devise::SessionsController
  include Devise::TestHelpers
end
