class PollingLocationImporter
  def initialize(data)
    @data = JSON.parse data
  end

  def build_all
    features.map do |feature|
      PollingLocation.new attributes_for(feature)
    end.compact
  end

  def create_all
    attributes = features.map do |feature|
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
    (@data['features'] || []).map do |feature|
      feature['attributes']
    end.reject do |feature|
      feature['ElectionDayTime'] == 'Closed'
    end
  end

  def attributes_for(feature)
    open, close = parse_times(feature['ElectionDayTime'])

    attributes = {
      api_id: feature['UniqueID'],
      name: feature['MVCName'],
      address: feature['Address'],
      zip: feature['Zip'],
      opens_at: open,
      closes_at: close
    }

    if feature['Voting'] =~ /early voting/i
      early_start_date = DateTime.parse(feature['OpenDate'].sub('Early Voting Begins', ''))
      early_open, early_close = parse_times(feature['OpenTimes'])
      attributes.merge!(
        early_voting_starts: early_start_date,
        early_voting_opens_at: early_open,
        early_voting_closes_at: early_close
      )
    end

    attributes
  end

  def parse_times(time_string)
    start_string, end_string = time_string.split(' to ')
    [DateTime.parse(start_string), DateTime.parse(end_string)]
  end
end
