class HotelsRoomtypesController < ApplicationController
  # GET /hotels_roomtypes
  # GET /hotels_roomtypes.xml
  def index
#    @hotels_roomtypes = HotelsRoomtype.all
     @hotels_roomtypes = HotelsRoomtype.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hotels_roomtypes }
    end
  end

  # GET /hotels_roomtypes/1
  # GET /hotels_roomtypes/1.xml
  def show
    @hotels_roomtype = HotelsRoomtype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hotels_roomtype }
    end
  end

  # GET /hotels_roomtypes/new
  # GET /hotels_roomtypes/new.xml
  def new
    @all_room_types = RoomType.all
    @hotel= Hotel.find(params[:hotel_id])
    @hotels_roomtype = @hotel.hotels_roomtypes.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hotels_roomtype }
    end
  end

  # GET /hotels_roomtypes/1/edit
  def edit
    @hotels_roomtype = HotelsRoomtype.find(params[:id])
  end

  # POST /hotels_roomtypes
  # POST /hotels_roomtypes.xml
  def create
    @hotels_roomtype = HotelsRoomtype.new(params[:hotels_roomtype])

    respond_to do |format|
      if @hotels_roomtype.save
        format.html { redirect_to( hotel_path(@hotels_roomtype.hotel), :notice => 'Hotels roomtype was successfully created.') }
        format.xml  { render :xml => @hotels_roomtype, :status => :created, :location => @hotels_roomtype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hotels_roomtype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hotels_roomtypes/1
  # PUT /hotels_roomtypes/1.xml
  def update
    @hotels_roomtype = HotelsRoomtype.find(params[:id])

    respond_to do |format|
      if @hotels_roomtype.update_attributes(params[:hotels_roomtype])
        format.html { redirect_to(@hotels_roomtype, :notice => 'Hotels roomtype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hotels_roomtype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels_roomtypes/1
  # DELETE /hotels_roomtypes/1.xml
  def destroy
    @hotels_roomtype = HotelsRoomtype.find(params[:id])
    @hotels_roomtype.destroy

    respond_to do |format|
      format.html { redirect_to(hotels_roomtypes_url) }
      format.xml  { head :ok }
    end
  end
end
