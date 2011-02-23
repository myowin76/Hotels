class HotelTypesController < ApplicationController
  # GET /hotel_types
  # GET /hotel_types.xml
  def index
    @hotel_types = HotelType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hotel_types }
    end
  end

  # GET /hotel_types/1
  # GET /hotel_types/1.xml
  def show
    @hotel_type = HotelType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hotel_type }
    end
  end

  # GET /hotel_types/new
  # GET /hotel_types/new.xml
  def new
    @hotel_type = HotelType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hotel_type }
    end
  end

  # GET /hotel_types/1/edit
  def edit
    @hotel_type = HotelType.find(params[:id])
  end

  # POST /hotel_types
  # POST /hotel_types.xml
  def create
    @hotel_type = HotelType.new(params[:hotel_type])

    respond_to do |format|
      if @hotel_type.save
        format.html { redirect_to(@hotel_type, :notice => 'Hotel type was successfully created.') }
        format.xml  { render :xml => @hotel_type, :status => :created, :location => @hotel_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hotel_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hotel_types/1
  # PUT /hotel_types/1.xml
  def update
    @hotel_type = HotelType.find(params[:id])

    respond_to do |format|
      if @hotel_type.update_attributes(params[:hotel_type])
        format.html { redirect_to(@hotel_type, :notice => 'Hotel type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hotel_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_types/1
  # DELETE /hotel_types/1.xml
  def destroy
    @hotel_type = HotelType.find(params[:id])
    @hotel_type.destroy

    respond_to do |format|
      format.html { redirect_to(hotel_types_url) }
      format.xml  { head :ok }
    end
  end
end
