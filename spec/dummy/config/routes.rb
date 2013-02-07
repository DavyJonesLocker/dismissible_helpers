Dummy::Application.routes.draw do
  dismissible_helpers_routes
  easy_auth_routes

  match 'landing/erb_block', :to => 'landing#erb_block'
  match 'landing/haml_block', :to => 'landing#haml_block'
  root :to => 'landing#show'
end
