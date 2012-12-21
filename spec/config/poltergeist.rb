require 'capybara/poltergeist'

RSpec.configure do |config|
  config.before(:suite) do
    Capybara.javascript_driver = :poltergeist
  end
end
