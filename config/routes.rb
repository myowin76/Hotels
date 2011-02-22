Hotels::Application.routes.draw do
  resources :photos

  resources :user_types

  resources :hotels_facilities

  resources :messages

  resources :reviews

  resources :hotels

  resources :room_types

  resources :facilities

  devise_for :users

  get "home/index"
  get "hotels/search"
  match "/contact-us" => "messages#new"
  match "/thankyou" => "messages#thankyou"
  match "/admin" =>"sessions#new"
  match "hotels/search" => "hotels#search_list"
  root :to => "home#index"
  
end
