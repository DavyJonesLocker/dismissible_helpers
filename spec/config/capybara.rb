require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:suite) do
    Capybara.server_port = 3999
  end
end

