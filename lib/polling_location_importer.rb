class PollingLocationImporter
  def initialize(data)
    @data = JSON.parse data
  end

  def build_all
    features.map do |feature|
      next if feature['attributes']['ElectionDayTime'] == 'Closed'
      PollingLocation.new attributes_for(feature)
    end.compact
  end

  def create_all
    attributes = features.map do |feature|
      next if feature['attributes']['ElectionDayTime'] == 'Closed'
      attributes = attributes_for(feature)
      if location = PollingLocation.find_by(api_id: attributes[:api_id])
        location.update! attributes
      else
        PollingLocation.create! attributes
      end
    end.compact
  end

  private

  def features
    @data['features'] || []
  end

  def attributes_for(feature)
    attributes = feature['attributes']

    open, close = parse_times(attributes['ElectionDayTime'])

    {
      api_id: attributes['UniqueID'],
      name: attributes['MVCName'],
      address: attributes['Address'],
      zip: attributes['Zip'],
      opens_at: open,
      closes_at: close
    }
  end

  def parse_times(time_string)
    start_string, end_string = time_string.split(' to ')
    [DateTime.parse(start_string), DateTime.parse(end_string)]
  end
end
