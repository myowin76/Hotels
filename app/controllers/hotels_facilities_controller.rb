class HotelsFacilitiesController < ApplicationController
  # GET /hotels_facilities
  # GET /hotels_facilities.xml
  def index
    @hotels_facilities = HotelsFacility.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hotels_facilities }
    end
  end

  # GET /hotels_facilities/1
  # GET /hotels_facilities/1.xml
  def show
    @hotels_facility = HotelsFacility.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hotels_facility }
    end
  end

  # GET /hotels_facilities/new
  # GET /hotels_facilities/new.xml
  def new
    @hotels_facility = HotelsFacility.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hotels_facility }
    end
  end

  # GET /hotels_facilities/1/edit
  def edit
    @hotels_facility = HotelsFacility.find(params[:id])
  end

  # POST /hotels_facilities
  # POST /hotels_facilities.xml
  def create
    @hotels_facility = HotelsFacility.new(params[:hotels_facility])

    respond_to do |format|
      if @hotels_facility.save
        format.html { redirect_to(@hotels_facility, :notice => 'Hotels facility was successfully created.') }
        format.xml  { render :xml => @hotels_facility, :status => :created, :location => @hotels_facility }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hotels_facility.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hotels_facilities/1
  # PUT /hotels_facilities/1.xml
  def update
    @hotels_facility = HotelsFacility.find(params[:id])

    respond_to do |format|
      if @hotels_facility.update_attributes(params[:hotels_facility])
        format.html { redirect_to(@hotels_facility, :notice => 'Hotels facility was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hotels_facility.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels_facilities/1
  # DELETE /hotels_facilities/1.xml
  def destroy
    @hotels_facility = HotelsFacility.find(params[:id])
    @hotels_facility.destroy

    respond_to do |format|
      format.html { redirect_to(hotels_facilities_url) }
      format.xml  { head :ok }
    end
  end
end
