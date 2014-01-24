$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'dismissible_helpers/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'dismissible_helpers'
  s.version     = DismissibleHelpers::VERSION
  s.authors     = ['Dan McClain']
  s.email       = ['git@danmcclain.net']
  s.homepage    = ''
  s.summary     = 'Simple Dismissible help text for your Rails projects'
  s.description = 'Simple Dismissible help text for your Rails projects'

  s.files = Dir['{app,config,db,lib}/**/*'] + ['Rakefile', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.0'

  if RUBY_PLATFORM =~ /java/
    s.add_development_dependency 'activerecord-jdbcpostgresql-adapter', '~> 1.3'
  else
    s.add_development_dependency 'pg', '~> 0.17'
  end
  s.add_development_dependency 'rspec-rails', '~> 2.14'
  s.add_development_dependency 'capybara', '~> 2.2'
  s.add_development_dependency 'fakeweb', '~> 1.3'
  s.add_development_dependency 'poltergeist', '~> 1.5'
  s.add_development_dependency 'database_cleaner', '~> 1.2'
  s.add_development_dependency 'factory_girl_rails', '~> 4.3'
  s.add_development_dependency 'factory_girl', '~> 4.3'
  s.add_development_dependency 'mocha', '~> 1.0'
  s.add_development_dependency 'launchy'
end
