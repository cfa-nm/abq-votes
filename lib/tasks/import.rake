require 'net/http'

namespace :import do
  desc 'Import polling locations'
  task :polling_locations => :environment do
    require 'polling_location_importer'

    url = URI.parse('http://coagisweb.cabq.gov')
    url.path = '/arcgis/rest/services/public/Voting2013/MapServer/0/query'
    url.query = { where: '1=1', outFields: '*', f: 'json' }.to_query

    json = Net::HTTP.get(url)
    PollingLocationImporter.new(json).create_all
  end
end
