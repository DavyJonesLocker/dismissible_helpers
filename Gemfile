source "http://rubygems.org"

# Declare your gem's dependencies in dismissible_helpers.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails'
gem 'coffee-rails'

unless ENV['CI']
  if RUBY_PLATFORM =~ /java/
    gem 'ruby-debug'
  elsif RUBY_VERSION == '1.9.3'
    gem 'debugger'
  end
end

gem 'fivemat'
