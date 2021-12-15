namespace :wizard do
  namespace :db do
    desc 'Add the default checklist options'
    task seed: :environment do
      SpreeStartupWizard::Engine.load_seed
    end
  end
end
