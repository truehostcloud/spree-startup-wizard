Spree::Core::Engine.routes.draw do
  namespace :admin do
    get 'startup_wizard', controller: :status, action: :index
    post 'startup_wizard/toggle', controller: :status, action: :toggle
  end
end
