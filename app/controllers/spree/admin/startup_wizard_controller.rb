module Spree
  module Admin
    class StartupWizardController < Spree::Admin::BaseController
      def index
        @store = Spree::Store.default
      end
    end
  end
end
