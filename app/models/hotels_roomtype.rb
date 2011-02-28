class HotelsRoomtype < ActiveRecord::Base
	set_table_name "hotel_roomtypes"
  attr_accessible :hotel_id, :room_type_id, :no_of_rooms, :price, :offer_price
  
  belongs_to :hotel
  belongs_to :room_type
end
