Hotels::Application.routes.draw do

  resources :locations

  resources :hotels_roomtypes

  get "accounts/profile"

  resources :hotel_types
  resources :room_types    
  resources :user_types
  resources :hotels_facilities
  resources :messages

  resources :hotels do
    resources :reviews
    resources :hotels_roomtypes
    resources :photos    
  end
#  resources :room_types
  resources :facilities
  devise_for :users, :path_names => {:sign_up => "register"}
  

  get "home/index"
  match "hotels/search/:location_name" => "hotels#browse_by_location", :as =>  "search_by_location"
  match "hotels/search" => "hotels#search", :as =>  "search_by"
  
  match "/contact-us" => "messages#new", :as=> "contact_us"
  match "/travel-guides" => "home#guides", :as=> "guides"
  match "/thankyou" => "messages#thankyou"
  match "/admin" =>"sessions#new"

  match "browse/:type_name/:location_name" => "hotels#find_by_location_of_hotel_type", :as => "find_by_location_of_hotel_type"  
  match "browse/:type_name" => "hotels#browse", :as => "browse_by"
  match "browse_by/:location_name/:type_name" => "hotels#browse_by_hotel_type_in_location", :as => "browse_by_hotel_type_in_location"     
  match "browse_by/:location_name" => "hotels#browse_by_location", :as => "browse_by_location"     
  
  match "hotels/:hotel_name/details" => "hotels#show" , :as => "details"  
  match "user-profile" => "accounts#profile", :as => :user_profile
  match "/about" => "home#about"
  match "/terms" => "home#terms"
  match "/privacy" => "home#privacy"
  

#  match "/deals/:location_name" => "hotels#find_by_location", :as => "find_by_location" 

  match "/deals/:location_name/:type_name" => "hotels#find_by_hotel_type_in_location", :as => "find_by_hotel_type_in_location"     
  match "/deals/:location_name" => "hotels#find_by_location", :as => "find_by_location"   
    match "/deals" => "hotels#deals", :as =>"deals"
  root :to => "home#index"
  
end
