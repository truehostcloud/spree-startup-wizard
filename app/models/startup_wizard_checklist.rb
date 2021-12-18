class StartupWizardChecklist < ApplicationRecord
  has_many :statuses, dependent: :destroy, class_name: 'StartupWizardStatus', foreign_key: 'checklist_id', inverse_of: 'startup_wizard_checklist'

  def status
    status = statuses.where(checklist_id: id).first
    return status.done unless status.nil?

    false
  end
end
