require 'spec_helper'
require 'polling_location_importer'

describe PollingLocationImporter do
  let(:data) { <<-JSON }
    { "features": [{
      "attributes": {
        "OBJECTID": 1,
        "MVCName": "Copper Pointe Church",
        "Address": "10500 Copper Ave NE",
        "Zip": 87123,
        "Geocode": "10500 Copper Ave NE",
        "Voting": "Election Day",
        "OpenTimes": "7:00 a.m. to 7:00 p.m.",
        "OpenDate": "November 19",
        "UniqueID": 1,
        "ElectionDayTime": "7:00 a.m. to 7:00 p.m."
      }
    }]}
  JSON

  subject(:importer) { PollingLocationImporter.new(data) }

  describe 'building' do
    subject(:locations) { importer.build_all }

    it { should_not be_empty }

    it 'produces valid records' do
      expect(locations).to all be_valid
    end
  end

  describe 'creating' do
    it 'creates records' do
      expect{ importer.create_all }.to change{ PollingLocation.count }.by 1
    end
  end

  it 'parses times' do
    open, close = importer.send(:parse_times, '7:00 a.m. to 7:00 p.m.')

    expect(open.hour).to eql 7
    expect(close.hour).to eql 19
  end
end
