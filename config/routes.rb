Spree::Core::Engine.add_routes do
  namespace :admin do
    get 'startup_wizard', controller: 'startup_wizard', action: 'index'
  end
end
