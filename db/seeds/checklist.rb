class PreloadedChecklist
  prepend Spree::ServiceModule::Base

  def call
    checklists = [
      {
        label: 'Create account.',
        order: 1
      },
      {
        label: 'Setup your website and storefront.',
        order: 2
      },
      {
        label: 'Add your products or services.',
        order: 3
      },
      {
        label: 'Review regional settings.',
        order: 4
      },
      {
        label: 'Choose how to deliver your goods.',
        order: 5
      },
      {
        label: 'Setup payment options.',
        order: 6
      }
    ].freeze

    ActiveRecord::Base.transaction do
      models = checklists.map do |item|
        StartupWizardChecklist.new item
      end
      models.each do |model|
        model.save
      end
    end
  end
end
