class RoomType < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :hotels_roomtypes
  has_many :hotels, :through => :hotels_roomtypes
  
end
