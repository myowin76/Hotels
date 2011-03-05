class AddLatitudeAndLongitudeToHotel < ActiveRecord::Migration
  def self.up
    add_column :hotels, :latitude, :decimal, :precision => 15, :scale => 10
    add_column :hotels, :longitude, :decimal,:precision => 15, :scale => 10
  end

  def self.down
    remove_column :hotels, :longitude
    remove_column :hotels, :latitude
  end
end
