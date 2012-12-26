Dummy::Application.routes.draw do
  dismissible_helpers_routes

  root :to => 'landing#show'
end
