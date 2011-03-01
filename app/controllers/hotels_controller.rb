class HotelsController < ApplicationController
#  before_filter :authenticate_user!, :except => [:search]
  def index

    if params[:search].blank?        
        #redirect_to root_url
        @hotels = Hotel.all
        render "search_list"
  	else
  		@hotels = Hotel.search(params[:search],params[:page])
      render "search_list"

  	end
    
    if user_signed_in?
      #@hotels = current_user.hotels.all
      #redirect_to user_profile_path
    else
      #redirect_to new_session_path  
	  end
  end

  def show
    @hotel = Hotel.find(params[:id])
    @all_room_types= RoomType.all
    @hotel_facilities = @hotel.facilities
    @hotel_reviews = @hotel.reviews
    @hotel_roomtypes = @hotel.hotels_roomtypes
    @room_type_name= @hotel_roomtypes.find_by_id(@all_room_types)
  end

  def new
#    @hotel = Hotel.new
    @hotel = current_user.hotels.new
    @photos = @hotel.photos.new
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
    @hotel = Hotel.find(params[:id])
    @all_facilities = Facility.all
  end

  def update
		params[:photo_ids] ||= []
    @hotel = Hotel.find(params[:id])
		unless params[:photo_ids].empty?
			Photo.destroy_pics(params[:id], params[:photo_ids])
		end
    
    @all_facilities = Facility.all
  	#@hotel.owner_id = current_user.id if current_user
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
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    redirect_to hotels_url, :notice => "Successfully destroyed hotel."
  end
  
  def search
  	if params[:search].blank?
        redirect_to root_url
  	else
  		@hotels = Hotel.search(params[:search])
      render "search_list"

  	end
  end

  private
	def get_hotel_facilities_from(facility_list)
		facility_list = [] if facility_list.blank?
		return facility_list.collect{|fid| Facility.find_by_id(fid.to_i)}.compact
	end
 
end
