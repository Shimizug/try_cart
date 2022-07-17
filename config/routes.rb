Rails.application.routes.draw do
  get 'care_items/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to =>"homes#top"

  resources :cart_item, only: [:create, :destroy, :update, :index] do
    collection do
      delete :destroy_all
    end
  end


end
