class Spree::Admin::StartupWizardController < Spree::Admin::BaseController
  def index
    @store = Spree::Store.default
  end
end
