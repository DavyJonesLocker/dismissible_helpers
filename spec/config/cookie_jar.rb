module CookieJar
  def cookies
    Capybara.current_session.driver.browser.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  end
end

RSpec.configure do |config|
  config.include CookieJar, :type => :request
end
