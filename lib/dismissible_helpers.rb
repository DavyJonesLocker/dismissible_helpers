require 'dismissible_helpers/engine'

module DismissibleHelpers
  extend ActiveSupport::Autoload

  autoload :Controllers
  autoload :Routes
  autoload :Helpers
end

ActionDispatch::Routing::Mapper.send(:include, DismissibleHelpers::Routes)
