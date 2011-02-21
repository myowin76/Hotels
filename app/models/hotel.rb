class Hotel < ActiveRecord::Base
  attr_accessible :name, :address, :postcode, :phone, :fax, :star, :no_of_rooms, :overview, :terms, :direction
  
  # Room Types (many-to-many)
  has_many :hotels_room_types
  has_many :room_types, :through => :hotels_room_types
  
  # Reviews
  has_many :reviews
  
  # Hotel Facilities (many-to-many)
  has_many :hotels_facilities, :dependent => :destroy
  has_many :facilities, :through => :hotels_facilities
	validates_presence_of :name, :address, :postcode, :phone, :star, :no_of_rooms

	def self.search(search, page)
		paginate :per_page =>5, :page => page,
								:conditions => ['address like ?',"%#{search}%"],
								:order => 'created_at DESC'
	end

	def photo_attributes=(photo_attributes)
		photo_attributes.each do |attributes|
			photos.build(attributes)
		end
	end

end
