class CreateHotelsFacilities < ActiveRecord::Migration
  def self.up
    create_table :hotels_facilities do |t|
      t.integer :hotel_id
      t.integer :facility_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hotels_facilities
  end
end
