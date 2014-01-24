source 'https://rubygems.org'

# Declare your gem's dependencies in dismissible_helpers.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem 'jquery-rails', '~> 3.0'
gem 'coffee-rails', '~> 4.0'

gem 'easy_auth', github: 'dockyard/easy_auth', ref:'54691011fa'
gem 'easy_auth-password', github: 'dockyard/easy_auth-password', ref: '0d5d8c22c2'

gem 'fivemat'

unless ENV['CI'] || RUBY_PLATFORM =~ /java/
  gem 'byebug'
end
