class HomeController < ApplicationController

  def index
    @menu_state = "class=active"
    @hotel_types = HotelType.all
  end
  

  def guides
    @menu_state_g = "class=active"
  end

  def privacy
    @menu_state_p = "class=active"
  end
  
  def about
    @menu_state_a = "class=active"
  end
end
