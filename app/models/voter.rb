class Voter < ActiveRecord::Base
  validates_presence_of :name, :email, :birthday
  validates_uniqueness_of :email
end
