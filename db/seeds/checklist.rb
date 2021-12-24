class PreloadedChecklist
  prepend Spree::ServiceModule::Base

  CHECKLISTS = [
    {
      label: 'Create account.',
      description: 'Yay!',
      order: 1
    },
    {
      label: 'Setup your website and storefront.',
      description: 'Create your own online presence with Ecwid’s free customizable website that is almost ready to go. Just fill in your business information, edit the website appearance and content, and start selling.',
      url: '/admin/stores/STORE_ID/edit',
      order: 2
    },
    {
      label: 'Add your products or services.',
      description: 'Get started by adding names, prices, and images.',
      url: '/admin/products',
      order: 3
    },
    {
      label: 'Review regional settings.',
      description: 'Review country, currency, and language settings of your store.',
      url: '/admin/stores/STORE_ID/edit',
      order: 4
    },
    {
      label: 'Choose how to deliver your goods.',
      description: 'Select which shipping options are available to customers when checking out. Add local delivery, self pickup, or enable automatic rates from carriers. If you don’t sell tangible goods, disable shipping completely.',
      url: '/admin/shipping_methods',
      order: 5
    },
    {
      label: 'Setup payment options.',
      description: 'Choose how people will be paying at checkout, including credit and debit cards, Apple Pay, cash, and more.',
      url: '/admin/payment_methods',
      order: 6
    }
  ].freeze

  def call
    if StartupWizardChecklist.count(:all) == CHECKLISTS.length
      puts 'Checklist is already populated. Consider deleteing if you want to seed again.'
      return
    end

    ActiveRecord::Base.transaction do
      models = CHECKLISTS.map do |item|
        StartupWizardChecklist.new item
      end
      models.each(&:save)
    end
  end
end
