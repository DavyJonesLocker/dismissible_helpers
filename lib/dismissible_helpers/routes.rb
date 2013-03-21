module DismissibleHelpers::Routes
  def dismissible_helpers_routes
    post '/dismissed_helpers' => 'dismissed_helpers#create', :as => :dismissed_helpers
    delete '/dismissed_helpers/:helper' => 'dismissed_helpers#destroy'
  end
end
