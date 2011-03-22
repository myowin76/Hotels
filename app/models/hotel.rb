include Geokit::Geocoders

class Hotel < ActiveRecord::Base
  attr_accessible :name, :address, :postcode, :phone, :fax, :location_id ,:star, :no_of_rooms, :overview, :terms, :direction,  :hotel_type_id, :photo_ids, :photo_attributes
  has_many :photos
  
  # Room Types (many-to-many)
  has_many :hotels_roomtypes,  :dependent => :destroy
  has_many :room_types, :through => :hotels_roomtypes
  
  #Hotel Type
  belongs_to :hotel_type
  belongs_to :location
  
  # Reviews
  has_many :reviews
  
	belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
	belongs_to :user
  
  # Hotel Facilities (many-to-many)
  has_many :hotels_facilities, :dependent => :destroy
  has_many :facilities, :through => :hotels_facilities
  
	validates_presence_of :name, :address, :postcode, :phone, :star, :no_of_rooms, :overview

  # Google Map
  acts_as_mappable   :default_units => :miles, 
                     :default_formula => :sphere, 
                     :distance_field_name => :distance,
                     :lat_column_name => :latitude,
                     :lng_column_name => :longitude,
                     :auto_geocode=>{:field=>:postcode, :error_message=>'Could not geocode address'}
  
    before_save :generate_longitude_latitude

	  #Get longitude and latitude from a PostCode
	  def generate_longitude_latitude
	    #Geocode the postcode
	    geocode = MultiGeocoder.geocode(self.postcode)
	    self.latitude = geocode.ll.split(",")[0]
	    self.longitude = geocode.ll.split(",")[1]
	  end

   #Get full address from longitude and latitude
   def area_address
     address=GoogleGeocoder.reverse_geocode([self.latitude,self.longitude])
     address.full_address
   end

   def self.search_with_location(google_loc, distance)

      #just set a default for distance now. might not need this once we sort the view.
      distance ||= 15 
      # ****** Removing the radius limit of the search ********
      sites = Hotel.find(:all, :origin => google_loc, :order => 'distance asc', :limit => 20 )
      #sites = Site.find(:all, :origin => google_loc, :within => distance, :order => 'distance asc', :limit => SITE_SEARCH_LIMIT, :include => :accessibilities, :conditions => ["accessibilities.code = ?", "PP"])
      #sites.delete_if {|s| !s.is_public?} #not great because it will delete sites and not give us back the right limit
   end

#  def self.hotel_owner?
#    return false if current_user.nil? || current_user.id != @hotel.owner_id
#		true		
#  end
  
#  def hotel_owner?(user)
#    return false if Self.owner_id != user.id
#    return true
#  end

  def all_hotel_locations

  end
  def self.top_hotels
    find(:all, :order => "star desc", :limit => 6)
    
  end

	def self.search(search,page)
	  loc = Location.find_by_name(search)
	  unless loc.nil?
		paginate :per_page =>5, :page => page,
								:conditions => ['address like ? OR location_id LIKE ?',"%#{search}%","%#{loc.id}%"],
								:order => 'created_at DESC'
		end						
#	search_condition = "%" + search + "%"
 #   find(:all, :conditions => ['address LIKE ? OR area LIKE ?', search_condition, search_condition])
  
	end

	def photo_attributes=(photo_attributes)
		photo_attributes.each do |attributes|
			photos.build(attributes)
		end
	end
	
	##########
  #creates the info for google popup thing
  ##########
  def map_info_window
    return "<div style=\"font-size: 14px;color:#000000;width:200px; \" ><div class='gmap_info_header'><a href='/rooms/#{self.id}'>#{self.name}</a></div></div>
  <div style=\"font-size: 10px;color:#000000;width:200px;\"><div class='gmap_info_address'><strong>Location:</strong> #{self.area}</div>
  <div class='gmap_info_address'><strong>Star:</strong>#{self.star}</div></div>"
  end
  

end
