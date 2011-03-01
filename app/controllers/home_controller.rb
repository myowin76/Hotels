class HomeController < ApplicationController

  def index
    @menu_state = "active"
    @hotel_types = HotelType.all
  end
  
  def browse
    
  end
  
  def guides
    @menu_state_g = "active"
  end

end
