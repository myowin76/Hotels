Hotels::Application.routes.draw do
  resources :messages

  resources :reviews

  resources :hotels_facilities

  resources :hotels

  resources :room_types

  resources :facilities

  devise_for :users

  get "home/index"
  match "/contact-us" => "messages#new"
  match "/thankyou" => "messages#thankyou"
  root :to => "home#index"
  
end
