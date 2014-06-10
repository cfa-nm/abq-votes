class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :name, null: false
      t.string :email, null: false, unique: true
      t.string :address, null: false
      t.integer :zip
      t.date :birthday, null: false

      t.timestamps
    end
  end
end
