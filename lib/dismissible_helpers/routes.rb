module DismissibleHelpers::Routes
  def dismissible_helpers_routes
    post '/dismissible_helpers' => 'dismissible_helpers#create', :as => :dismissible_helpers
  end
end
