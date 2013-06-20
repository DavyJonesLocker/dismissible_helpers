Dummy::Application.routes.draw do
  dismissible_helpers_routes
  easy_auth_routes

  get 'landing/restorable', :to => 'landing#restorable'
  get 'landing/block', :to => 'landing#block'
  root 'landing#show'
end
