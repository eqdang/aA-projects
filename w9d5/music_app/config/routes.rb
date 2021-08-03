Rails.application.routes.draw do
  root to: redirect("/bands")

  resources :tracks
  
  resources :albums, only: [:create, :edit, :show, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  resources :bands do
    resources :albums, only: [:new]
  end

  resource :session, only: [:create, :destroy, :new]
  
  resources :users, only: [:create, :new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
