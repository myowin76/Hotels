class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :admin_user?, :owner_user?, :admin_or_owner?, :customer_user?, :hotel_owner?
  
  def customer_user?
    return false if current_user.nil? || current_user.user_type.name != "User"
		true
		
  end
	def owner_user?
		return false if current_user.nil? || current_user.user_type.name != "Owner"
		true
	end
  
	def admin_user?
		return false if current_user.nil? || current_user.user_type.name != "Admin"
		true
	end
	
	def hotel_owner?(user,hotel)
	  return false if current_user.nil? || (hotel.owner_id != user.id)
		true
  end

	def admin_or_owner?(id)
	  if(admin_user? || owner_user?)
	    return true
	  else
      return false
    end
	end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end


