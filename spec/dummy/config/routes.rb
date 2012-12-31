Dummy::Application.routes.draw do
  dismissible_helpers_routes
  easy_auth_routes

  root :to => 'landing#show'
end
