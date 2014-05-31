require 'spec_helper'

describe PollingLocation, :type => :model do
  describe '#early_voting?' do
    context 'with early voting' do
      subject { build_stubbed(:polling_location, :early_voting) }
      it { should have_early_voting }
    end

    context 'without early voting' do
      subject { build_stubbed(:polling_location) }
      it { should_not have_early_voting }
    end
  end
end
