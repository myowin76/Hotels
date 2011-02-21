class HotelsFacilitiesController < ApplicationController
  def index
    @hotels_facilities = HotelsFacilities.all
  end

  def show
    @hotels_facilities = HotelsFacilities.find(params[:id])
  end

  def new
    @hotels_facilities = HotelsFacilities.new
  end

  def create
    @hotels_facilities = HotelsFacilities.new(params[:hotels_facilities])
    if @hotels_facilities.save
      redirect_to @hotels_facilities, :notice => "Successfully created hotels facilities."
    else
      render :action => 'new'
    end
  end

  def edit
    @hotels_facilities = HotelsFacilities.find(params[:id])
  end

  def update
    @hotels_facilities = HotelsFacilities.find(params[:id])
    if @hotels_facilities.update_attributes(params[:hotels_facilities])
      redirect_to @hotels_facilities, :notice  => "Successfully updated hotels facilities."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @hotels_facilities = HotelsFacilities.find(params[:id])
    @hotels_facilities.destroy
    redirect_to hotels_facilities_url, :notice => "Successfully destroyed hotels facilities."
  end
end
