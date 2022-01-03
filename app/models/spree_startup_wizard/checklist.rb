module SpreeStartupWizard
  class Checklist < ApplicationRecord
    self.table_name = 'startup_wizard_checklists'

    has_many :statuses, dependent: :destroy, class_name: 'Status', inverse_of: 'startup_wizard_checklist'

    def status
      status = statuses.where(checklist_id: id).first
      return status.done unless status.nil?

      false
    end
  end
end
