require 'dismissible_helpers/engine'

module DismissibleHelpers
  extend ActiveSupport::Autoload

  autoload :Controllers
  autoload :Routes
  autoload :Helpers
  autoload :ContentBuilder
  autoload :DismissedChecker
  autoload :DismissedHelpersExtractor

end

ActionDispatch::Routing::Mapper.send(:include, DismissibleHelpers::Routes)
