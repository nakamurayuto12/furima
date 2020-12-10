Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update] do
    #resources :purchase_management, only: [:index]
  end
end

