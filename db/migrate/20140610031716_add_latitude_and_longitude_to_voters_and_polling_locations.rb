class AddLatitudeAndLongitudeToVotersAndPollingLocations < ActiveRecord::Migration
  def change
    add_column :voters, :latitude, :float, null: false
    add_column :voters, :longitude, :float, null: false

    add_column :polling_locations, :latitude, :float, null: false
    add_column :polling_locations, :longitude, :float, null: false
  end
end
