Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

    get '/users', to: 'users#index', as: 'user'
    
    get '/users/:id', to: 'users#show', as: 'show_user'

    post '/users', to: 'users#create', as: 'create_user'

    put '/users/:id', to: 'users#update', as: 'update_user'

    delete '/users/:id', to: 'users#destroy', as: 'destroy_user'


    get '/users/:user_id/artworks', to: 'artworks#index', as: 'user_artwork'
    
    # get '/artworks', to: 'artworks#index', as: 'artwork'
    
    get '/artworks/:id', to: 'artworks#show', as: 'show_artwork'

    post '/artworks', to: 'artworks#create', as: 'create_artwork'

    put '/artworks/:id', to: 'artworks#update', as: 'update_artwork'

    delete '/artworks/:id', to: 'artworks#destroy', as: 'destroy_artwork'

    get '/artwork_shares', to: 'artwork_shares#index', as: 'artwork_shares'
  
    post '/artwork_shares', to: 'artwork_shares#create', as: 'create_artwork_shares'
    
    delete '/artwork_shares/:id', to: 'artwork_shares#destroy', as: 'destroy_artwork_shares'

    resources :artwork_shares, only: [:index, :create, :destroy]
    
    get '/comments', to: 'comments#index', as: 'comments_index'
    
    post '/comments', to: 'comments#create', as: 'create_comment'
    
    delete '/comments/:id', to: 'comments#destroy', as: 'destroy_comment'



end
