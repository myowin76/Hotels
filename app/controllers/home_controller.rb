class HomeController < ApplicationController

  def index
    @menu_state = "class=active"
    @hotel_types = HotelType.all
    @top_hotels = Hotel.top_hotels

  end
  

  def guides
    @menu_state_g = "class=active"
  end

  def under_construction
    
  end
end
