class HotelsController < ApplicationController
#  before_filter :authenticate_user!, :except => [:search]
  def index
    if params[:search].blank?
        redirect_to root_url
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
    @hotel_facilities = @hotel.facilities
    @hotel_reviews = @hotel.reviews
  end

  def new
    @hotel = Hotel.new
    @all_facilities = Facility.all
  end

  def create
    @hotel = Hotel.new(params[:hotel])
    @all_facilities = Facility.all
  	@hotel.owner_id = current_user.id if current_user
  	checked_h_facilities = get_hotel_facilities_from(params[:hotel_facility_list])
  	removed_h_facilities = @all_facilities - checked_h_facilities
  	
    
    if @hotel.save
      
	    checked_h_facilities.each {|h_facility|@hotel.facilities<< h_facility if !@hotel.facilities.include?(h_facility)}
	    removed_h_facilities.each {|h_facility|@hotel.facilities.delete(h_facility) if @hotel.facilities.include?(h_facility)}

      redirect_to @user_profile_path, :notice => "Successfully created hotel."
    else
      render :action => 'new'
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update_attributes(params[:hotel])
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
