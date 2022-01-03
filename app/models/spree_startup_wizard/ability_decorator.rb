module SpreeStartupWizard
  module AbilityDecorator
    def abilities_to_register
      super << SpreeStartupWizard::StartupWizardStatusAbility
    end
  end
end

Spree::Ability.prepend SpreeStartupWizard::AbilityDecorator
