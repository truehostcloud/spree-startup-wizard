class CreateStartupWizardStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :startup_wizard_statuses do |t|
      t.bigint :checklist_id, null: false
      t.bigint :store_id, null: false
      t.boolean :done, null: false, default: false

      t.index %w[checklist_id store_id], name: 'index_startup_wizard_checklists_on_checklist_id_and_store_id', unique: true
      t.index :checklist_id, name: 'index_startup_wizard_checklists_on_checklist_id'
      t.index :store_id, name: 'index_startup_wizard_statuses_on_store_id'

      t.timestamps
    end
  end
end
