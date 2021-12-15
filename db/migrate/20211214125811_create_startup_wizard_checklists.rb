class CreateStartupWizardChecklists < ActiveRecord::Migration[6.1]
  def change
    create_table :startup_wizard_checklists do |t|
      t.string :label, null: false
      t.string :description, null: true
      t.string :url, null: true
      t.integer :order, null: false

      t.timestamps
    end
  end
end
