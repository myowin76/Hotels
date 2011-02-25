Hotels::Application.routes.draw do

  get "accounts/profile"

  get "destroy/account"

  get "account/profile"

  resources :hotel_types
  resources :photos
  resources :user_types
  resources :hotels_facilities
  resources :messages
  resources :reviews
  resources :hotels
  resources :room_types
  resources :facilities
  devise_for :users, :path_names => {:sign_up => "register"}

  get "home/index"
  get "hotels/search"
  match "/contact-us" => "messages#new"
  match "/thankyou" => "messages#thankyou"
  match "/admin" =>"sessions#new"
  match "hotels/search" => "hotels#search_list"
  match "user-profile" => "accounts#profile", :as => :user_profile
  root :to => "home#index"
  
end
