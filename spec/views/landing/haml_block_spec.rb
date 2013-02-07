require 'spec_helper'

describe 'landing/haml_block.html.haml' do

  it 'should display the dismissible helper rendered with a block' do
    render
    doc = Capybara.string(rendered)
    p = doc.find('p')
    p.text.should include('Amazing haml!')
  end

end
