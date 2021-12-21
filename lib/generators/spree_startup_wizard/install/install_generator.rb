module SpreeStartupWizard
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :migrate, type: :boolean, default: true

      def install
        Dir.chdir(Gem.loaded_specs['spree_startup_wizard'].full_gem_path) do
          run 'yarn install'
          run 'yarn build'
        end
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_startup_wizard'
      end

      def run_migrations
        run_migrations = options[:migrate] || ['', 'y', 'Y'].include?(ask('Would you like to run the migrations now? [Y/n]'))
        if run_migrations
          run 'bundle exec rails db:migrate'
        else
          puts 'Skipping rails db:migrate, don\'t forget to run it!'
        end
      end

      def seed_table
        rake 'wizard:db:seed'
      end
    end
  end
end
