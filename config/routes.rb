Hotels::Application.routes.draw do

  resources :hotels_roomtypes

  get "accounts/profile"

  get "destroy/account"

  get "account/profile"

  resources :hotel_types
  resources :room_types  
  resources :photos
  resources :user_types
  resources :hotels_facilities
  resources :messages

  resources :hotels do
    resources :reviews
    resources :hotels_roomtypes
  end
#  resources :room_types
  resources :facilities
  devise_for :users, :path_names => {:sign_up => "register"}

  get "home/index"
  get "hotels/search"
  match "/contact-us" => "messages#new", :as=> "contact_us"
  match "/travel-guides" => "home#guides", :as=> "guides"
  match "/thankyou" => "messages#thankyou"
  match "/admin" =>"sessions#new"
#  match "hotels/search" => "hotels#search_list"
  match "user-profile" => "accounts#profile", :as => :user_profile
  root :to => "home#index"
  
end
