class StartupWizardStatus < ApplicationRecord
  belongs_to :store, class_name: 'Spree::Store'
  belongs_to :startup_wizard_checklist, class_name: 'StartupWizardChecklist', foreign_key: 'checklist_id'
end
