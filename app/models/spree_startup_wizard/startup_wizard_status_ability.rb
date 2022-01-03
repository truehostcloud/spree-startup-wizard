module SpreeStartupWizard
  class StartupWizardStatusAbility
    include CanCan::Ability

    def initialize(user)
      @vendor_ids = user.vendors.active.ids

      return unless @vendor_ids.any?

      can :read, SpreeStartupWizard::Checklist
      can :manage, SpreeStartupWizard::Status
      can :manage, :startup_wizard_statuses
    end
  end
end
