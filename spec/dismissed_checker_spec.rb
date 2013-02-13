require 'spec_helper'

describe DismissibleHelpers::DismissedChecker do

  describe '#dismissed?' do
    context 'when the dismissed_helpers includes the key' do
      it 'should return true' do
        checker = described_class.new('a')
        checker.stubs(:dismissed_helpers).returns(['a'])
        checker.should be_dismissed
      end
    end

    context 'the dismissed_helpers does not include the key' do
      it 'should return false' do
        checker = described_class.new('a')
        checker.stubs(:dismissed_helpers).returns([])
        checker.should_not be_dismissed
      end
    end

  end
end
