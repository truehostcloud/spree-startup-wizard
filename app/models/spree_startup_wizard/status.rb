module SpreeStartupWizard
  class Status < ApplicationRecord
    self.table_name = 'startup_wizard_statuses'
    belongs_to :store, class_name: 'Spree::Store'
    belongs_to :startup_wizard_checklist, class_name: 'Checklist', foreign_key: 'checklist_id'
  end
end
