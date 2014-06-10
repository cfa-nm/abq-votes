class PollingLocation < ActiveRecord::Base
  geocoded_by :address

  validates_presence_of :api_id, :name, :address, :zip, :opens_at, :closes_at

  after_validation :geocode,
    if: ->(obj){ obj.address_changed? }

  def has_early_voting?
    !early_voting_starts.nil?
  end
end
