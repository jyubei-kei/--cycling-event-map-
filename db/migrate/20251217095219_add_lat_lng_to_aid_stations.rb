class AddLatLngToAidStations < ActiveRecord::Migration[7.0]
  def change
    add_column :aid_stations, :latitude, :decimal, precision: 10, scale:6
    add_column :aid_stations, :longitude, :decimal, precision: 10, scale:6
  end
end
