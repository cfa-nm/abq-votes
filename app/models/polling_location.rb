class PollingLocation < ActiveRecord::Base
  validates :api_id, :name, :address, :zip, :opens_at, :closes_at, presence: true

  def has_early_voting?
    !early_voting_starts.nil?
  end
end
