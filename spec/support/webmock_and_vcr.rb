require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join('spec', 'fixtures', 'vcr')
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
