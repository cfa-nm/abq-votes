require 'spec_helper'

describe Voter, :type => :model do
  subject(:voter) { build_stubbed :voter,
                    address: '2300 Central Ave', zip: 87106 }

  describe '.polling_location' do
    let!(:nearest)  { create :polling_location,
                      address: '2400 Central Ave', zip: 87106 }
    let!(:farthest) { create :polling_location,
                      address: '2500 Central Ave', zip: 87106 }

    before { voter.geocode }

    it 'should be the closest polling location' do
      expect(voter.polling_location).to eq nearest
    end
  end
end
