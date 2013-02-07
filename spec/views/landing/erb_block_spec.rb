require 'spec_helper'

describe 'landing/erb_block.html.erb' do

  it 'should display the dismissible helper rendered with a block' do
    render
    doc = Capybara.string(rendered)
    p = doc.find('p')
    p.text.should include('Amazing matey!')
  end

end
