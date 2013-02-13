Dummy::Application.routes.draw do
  dismissible_helpers_routes
  easy_auth_routes

  match 'landing/block', :to => 'landing#block'
  root :to => 'landing#show'
end
