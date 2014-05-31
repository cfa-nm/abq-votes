require 'net/http'

namespace :import do
  desc 'Import polling locations'
  task :polling_locations => :environment do
    require 'polling_location_importer'

    url = '/arcgis/rest/services/public/Voting2013/MapServer/0/query?where=1%3D1&geometryType=esriGeometryEnvelope&spatialRel=esriSpatialRelIntersects&outFields=*&returnGeometry=true&returnIdsOnly=false&returnCountOnly=false&returnZ=false&returnM=false&f=pjson'
    Net::HTTP.start('coagisweb.cabq.gov') do |http|
      resp = http.get url
      json = resp.body
      PollingLocationImporter.new(json).create_all
    end
  end
end
