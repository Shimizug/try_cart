Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to =>"homes#top"

  resources :cart_item, only: [:create, :destroy, :update, :index] 
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'

end
