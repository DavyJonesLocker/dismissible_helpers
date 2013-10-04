require 'spec_helper'

describe DismissibleHelpers::RestorableContentBuilder do
  # Temporarily look for hidden elements to make sure that we are rendering hidden links
  before { Capybara.ignore_hidden_elements = false }
  after  { Capybara.ignore_hidden_elements = true }

  describe '#build' do
    context 'given a string' do
      it 'should build a dismissible div containing the string as its contents' do
        content = "<p>Great</p>"
        builder = described_class.new(content)
        html = builder.build
        doc = Capybara.string(html)
        p_el = doc.find('div.dismissible p')
        p_el.text.should == 'Great'
      end
    end

    it 'should have a close button' do
      builder = described_class.new('something')
      html = builder.build
      doc = Capybara.string(html)
      close_el = doc.find('div a.close')
      close_el[:href].should == '#'
    end

    it 'should have a open button' do
      builder = described_class.new('something')
      html = builder.build
      doc = Capybara.string(html)
      close_el = doc.find('div a.open')
      close_el[:href].should == '#'
    end
  end
end
