class RoomType < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :hotels_room_types
  has_many :hotels, :through => :hotels_room_types
  
end
