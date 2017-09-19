Rails.application.routes.draw do
  resources :cards  

  root 'home#index'
  post '/' => "home#check_translation"
end
