class Voter < ActiveRecord::Base
  geocoded_by :address

  validates_presence_of :name, :email, :birthday, :address
  validates_uniqueness_of :email

  after_validation :geocode,
    if: ->(obj){ obj.address_changed? }

  def polling_location
    PollingLocation.near(self).first
  end
end
