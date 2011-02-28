class AccountsController < ApplicationController
  before_filter :authenticate_user!

  def profile
   @user = User.find(current_user.id)
     @hotels = current_user.hotels
#     @hotel_room_types = current_user.hotel.room_types
#     @bookmarks = current_user.bookmarks
#     @reviews = current_user.reviews   
  end

end
