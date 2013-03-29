require 'spec_helper'

describe 'landing/restorable.html.erb' do

  it 'should display the dismissible helper rendered with a block' do
    render

    doc = Capybara.string(rendered)
    wrapper = doc.find('.dismissible')
    wrapper.should have_selector('.open')
    wrapper.should have_selector('.close')
    wrapper.find("div:first").should have_content 'Click to Dismiss or Show'
  end

end
