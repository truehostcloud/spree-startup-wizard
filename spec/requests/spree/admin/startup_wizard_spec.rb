require 'rails_helper'

RSpec.describe "Spree::Admin::StartupWizards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/spree/admin/startup_wizard/index"
      expect(response).to have_http_status(:success)
    end
  end

end
