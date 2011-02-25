class HomeController < ApplicationController

  def index
    @hotel_types = HotelType.all
  end
  
  def browse
    
  end

end
