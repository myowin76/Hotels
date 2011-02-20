Hotels::Application.routes.draw do
  devise_for :users

  get "home/index"
  match "/contact-us" => "home#contact"

  root :to => "home#index"
  
end
