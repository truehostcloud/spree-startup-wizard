module Spree
  module Admin
    class StartupWizardController < Spree::Admin::BaseController
      def index
        @checklist = StartupWizardChecklist.order(order: :asc)
      end
    end
  end
end
