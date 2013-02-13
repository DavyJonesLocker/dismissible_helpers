require 'spec_helper'

describe DismissibleHelpers::DismissedHelpersExtractor do

  describe '#extract' do
    context 'the user exists and has the dismissed_helpers field' do
      it 'should return the user#dismissed_helpers' do
        user = build_stubbed(:user, :dismissed_helpers => ['a'])
        extractor = described_class.new(user, nil)
        extractor.extract.should == ['a']
      end
    end

    context 'the user does not exist or exists but does not have the dismissed_helpers field' do
      context 'the cookie exists' do
        it 'should return the cookie split into an array' do
          extractor = described_class.new(nil, 'a|c|b')
          extractor.extract.should == %w(a c b)
        end
      end

      context 'the cookie does not exist' do
        it 'should return an empty array' do
          extractor = described_class.new(nil, nil)
          extractor.extract.should == []
        end
      end
    end
  end

end
