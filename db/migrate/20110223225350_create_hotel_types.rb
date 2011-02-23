class CreateHotelTypes < ActiveRecord::Migration
  def self.up
    create_table :hotel_types do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
    HotelType.create(:name=>'Bed and Breakfast')
    HotelType.create(:name=>'Family Hotels')
    HotelType.create(:name=>'Cheap Hotels')
    HotelType.create(:name=>'Airport Hotels')
    HotelType.create(:name=>'Luxury Hotels')
    HotelType.create(:name=>'Boutique Hotels')
    HotelType.create(:name=>'Corporate Hotels')
    HotelType.create(:name=>'Apartment Hotels')
    HotelType.create(:name=>'5 Stars Hotels')                        
  end

  def self.down
    drop_table :hotel_types
  end
end
