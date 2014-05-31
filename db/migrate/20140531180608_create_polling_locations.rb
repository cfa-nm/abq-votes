class CreatePollingLocations < ActiveRecord::Migration
  def change
    create_table :polling_locations do |t|
      t.integer :api_id,                 null: false
      t.string  :name,                   null: false
      t.string  :address,                null: false
      t.integer :zip,                    null: false
      t.time    :opens_at,               null: false
      t.time    :closes_at,              null: false
      t.date    :early_voting_starts
      t.time    :early_voting_opens_at
      t.time    :early_voting_closes_at

      t.timestamps
    end
  end
end
