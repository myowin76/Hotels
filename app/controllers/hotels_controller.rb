class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
    if params[:location].blank?
        redirect_to root_url
  	else
  		@hotels = Hotel.search(params[:location],params[:page])
  		render 'index'
  	end
  	
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(params[:hotel])
    if @hotel.save
      redirect_to @hotel, :notice => "Successfully created hotel."
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
  	if params[:location].blank?
        redirect_to root_url
  	else
  		@hotels = Hotel.search(params[:location],params[:page])
  		render 'index'
  	end

	
  end
end
