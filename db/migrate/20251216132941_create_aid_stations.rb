class CreateAidStations < ActiveRecord::Migration[7.0]
  def change
    create_table :aid_stations do |t|
      t.references :event, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
