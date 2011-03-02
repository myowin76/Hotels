class Hotel < ActiveRecord::Base
  attr_accessible :name, :address, :postcode, :phone, :fax, :star, :no_of_rooms, :overview, :terms, :direction,  :hotel_type_id, :photo_ids, :photo_attributes
  has_many :photos
  
  # Room Types (many-to-many)
  has_many :hotels_roomtypes,  :dependent => :destroy
  has_many :room_types, :through => :hotels_roomtypes
  
  #Hotel Type
  belongs_to :hotel_type
  
  # Reviews
  has_many :reviews
  
	belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
	belongs_to :user
  
  # Hotel Facilities (many-to-many)
  has_many :hotels_facilities, :dependent => :destroy
  has_many :facilities, :through => :hotels_facilities
  
	validates_presence_of :name, :address, :postcode, :phone, :star, :no_of_rooms

  def self.hotel_owner?
    return false if current_user.nil? || current_user.id != @hotel.owner_id
		true		
  end
  
  def hotel_owner?(user)
    return false if Self.owner_id != user.id
    return true
  end

  def top_rated
#    find(:all,)
  end

	def self.search(search,page)
		paginate :per_page =>5, :page => page,
								:conditions => ['address like ? OR area LIKE ?',"%#{search}%","%#{search}%"],
								:order => 'created_at DESC'
#	search_condition = "%" + search + "%"
 #   find(:all, :conditions => ['address LIKE ? OR area LIKE ?', search_condition, search_condition])
  
	end

	def photo_attributes=(photo_attributes)
		photo_attributes.each do |attributes|
			photos.build(attributes)
		end
	end

end
