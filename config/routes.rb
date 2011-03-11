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
  
  get "hotels/search"

  get "home/index"
  match "hotels/search" => "hotels#search", :as =>  "search_by"
  match "/contact-us" => "messages#new", :as=> "contact_us"
  match "/travel-guides" => "home#guides", :as=> "guides"
  match "/thankyou" => "messages#thankyou"
  match "/admin" =>"sessions#new"
  match "browse/:type_name" => "hotels#browse", :as => "browse_by"
  match "hotels/:hotel_name/details" => "hotels#show" , :as => "details"  
  match "user-profile" => "accounts#profile", :as => :user_profile
  root :to => "home#index"
  
end
