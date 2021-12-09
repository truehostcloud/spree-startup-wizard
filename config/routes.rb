Spree::Core::Engine.routes.draw do
  namespace :admin do
    get 'startup_wizard',  controller: 'startup_wizard', action: "index"
  end
end