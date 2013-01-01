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

  s.files = Dir['{app,config,db,lib}/**/*'] + ['Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 3.2.9'

  if RUBY_PLATFORM =~ /java/
    s.add_development_dependency 'jdbc-sqlite3'
    s.add_development_dependency 'activerecord-jdbcsqlite3-adapter'
  else
    s.add_development_dependency 'sqlite3'
  end
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'fakeweb'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails', '~> 1.7.0'
  s.add_development_dependency 'factory_girl', '~> 2.6.0'
  s.add_development_dependency 'mocha', '~> 0.10.5'
  s.add_development_dependency 'launchy'
end
