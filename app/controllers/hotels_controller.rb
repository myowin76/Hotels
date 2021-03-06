class HotelsController < ApplicationController
  before_filter :authenticate_user!, :except => [:search, :browse, :show, :deals, :browse_by_location, :find_by_location, :find_by_hotel_type_in_location,:find_by_location_of_hotel_type, :browse_by_hotel_type_in_location]
  def index
    @menu_state_d = "class='active'"
    @top_hotels=Hotel.find(:all, :limit => 4, :order => 'star desc' )
    @hotels = Hotel.all
    @hotel_types = HotelType.all

    if params[:search].blank?
        render "search_list"
  	else
  		@hotels = Hotel.search(params[:search].downcase,params[:page])
      render "search_list"
  	end
  end
  
  def deals
    
    @menu_state_d = "class='active'"
    @top_hotels=Hotel.find(:all, :limit => 4, :order => 'star desc' )
    @hotels = Hotel.all
    @hotel_types = HotelType.all
    
    if params[:location_name]
      @loc
      render "browse_list_deals"
    else
      
      render "browse_list_deals"
    end
  end

  def show
    unless params[:hotel_name].nil?
      @hotel = Hotel.find_by_name(params[:hotel_name])
    end
    if params[:id]
      @hotel = Hotel.find(params[:id])  
    end
    @hotel_facilities = @hotel.facilities
    @hotel_reviews = @hotel.reviews
    @hotel_roomtypes = @hotel.hotels_roomtypes
    @room_type_name= @hotel.room_types.name
     	
  end

  def new
#    @hotel = Hotel.new
    @hotel = current_user.hotels.new
#    @photos = @hotel.photos.new
    @all_facilities = Facility.all
  end

  def create
    #can use? 
    @hotel =current_user.hotels.build(params[:hotel])
    @photos = @hotel.photos.new(params[:hotel])

    @all_facilities = Facility.all
  	checked_h_facilities = get_hotel_facilities_from(params[:hotel_facility_list])
  	removed_h_facilities = @all_facilities - checked_h_facilities
  	
    
    if @hotel.save
      
	    checked_h_facilities.each {|h_facility|@hotel.facilities<< h_facility if !@hotel.facilities.include?(h_facility)}
	    removed_h_facilities.each {|h_facility|@hotel.facilities.delete(h_facility) if @hotel.facilities.include?(h_facility)}

      redirect_to user_profile_path, :notice => "Successfully created hotel."
    else
      render :action => 'new'
    end
  end

  def edit
    unless params[:hotel_name].nil?
      @hotel = Hotel.find_by_name(params[:hotel_name])
    end    
    if params[:id]
      @hotel = current_user.hotels.find(params[:id])
    end
    @all_facilities = Facility.all
  end

  def update

		params[:photo_ids] ||= []
    @hotel = Hotel.find(params[:id])
		unless params[:photo_ids].empty?
			Photo.destroy_pics(params[:id], params[:photo_ids])
		end
    
    @all_facilities = Facility.all
  	checked_h_facilities = get_hotel_facilities_from(params[:hotel_facility_list])
  	removed_h_facilities = @all_facilities - checked_h_facilities
    
    if @hotel.update_attributes(params[:hotel])
      checked_h_facilities.each {|h_facility|@hotel.facilities<< h_facility if !@hotel.facilities.include?(h_facility)}
	    removed_h_facilities.each {|h_facility|@hotel.facilities.delete(h_facility) if @hotel.facilities.include?(h_facility)}
	    
      redirect_to @hotel, :notice  => "Successfully updated hotel."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @hotel = current_user.hotels.find(params[:id])
    @hotel.destroy
    redirect_to user_profile_path, :notice => "Successfully destroyed hotel."
  end
  
  def search

    @top_hotels=Hotel.find(:all, :order => 'star desc', :limit => 5)
    if params[:search].blank?        
        #redirect_to root_url
        @hotels = Hotel.all

  	    @hotel_types = HotelType.all
        render "search_list"
  	else
  		  @hotels = Hotel.search(params[:search].downcase,params[:page])
  	    @hotel_types = HotelType.all
      render "search_list"

  	end
  end
  
  def browse
    @top_hotels=Hotel.find(:all, :order => 'star desc', :limit => 5)
  	hotel_type = HotelType.find_by_name(params[:type_name])

    @hotels = Hotel.find_all_by_hotel_type_id(hotel_type.id)
    render "browse_list"
  end


  def browse_by_location
  	    @hotel_types = HotelType.all  		
        @top_hotels=Hotel.find(:all, :order => 'star desc', :limit => 5)
        location = Location.find_by_name(params[:location_name])
      @hotels = Hotel.find_all_by_location_id(location)

      render "browse_list"      
  end

  def browse_by_hotel_type_in_location
    @top_hotels=Hotel.find(:all, :order => 'star desc', :limit => 5)    
    location = Location.find_by_name(params[:location_name]) if params[:location_name]
  	hotel_type = HotelType.find_by_name(params[:type_name]) if params[:type_name]
  	@hotels = Hotel.find_all_by_location_id_and_hotel_type_id(location.id, hotel_type.id)
  	render "browse_list"
    
  end
  
  def browse_by_location_of_hotel_type


  	render "browse_list"
  end

  def find_by_location
  	    @hotel_types = HotelType.all  		
        @top_hotels=Hotel.find(:all, :order => 'star desc', :limit => 5)
        location = Location.find_by_name(params[:location_name])
      @hotels = Hotel.find_all_by_location_id(location)

      render "browse_list_deals"      
  end

  def find_by_hotel_type_in_location
      @top_hotels=Hotel.find(:all, :order => 'star desc', :limit => 5)    
      location = Location.find_by_name(params[:location_name]) if params[:location_name]
    	hotel_type = HotelType.find_by_name(params[:type_name]) if params[:type_name]
  	@hotels = Hotel.find_all_by_location_id_and_hotel_type_id(location.id, hotel_type.id)
    	render "browse_list_deals"
  end

  def find_by_location_of_hotel_type
    @top_hotels=Hotel.find(:all, :order => 'star desc', :limit => 5)    
    location = Location.find_by_name(params[:location_name])
  	hotel_type = HotelType.find_by_name(params[:type_name])
  	@hotels = Hotel.find_all_by_location_id_and_hotel_type_id(location.id, hotel_type.id)
  	render "browse_list"
    
  end
  private
	def get_hotel_facilities_from(facility_list)
		facility_list = [] if facility_list.blank?
		return facility_list.collect{|fid| Facility.find_by_id(fid.to_i)}.compact
	end
  
  
end
