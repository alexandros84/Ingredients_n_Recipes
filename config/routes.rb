Rails.application.routes.draw do
  
  get 'sessions/new'

  root "static_pages#home"
  
  get '/home', to: 'static_pages#home'

  get '/about', to: 'static_pages#about'
  
  get '/signup', to: 'users#new'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/users/:user_id/drawers/:id', to: 'drawers#update'
  
  resources :users do 
  resources :recipes
  end
  
    resources :api_requests 
  
  resources :users do 
  resources :drawers
  end
  
  resources :drawers do 
  resources :drawer_ingredients
  end 
  
  resources :users do 
  resources :drawers do 
    get 'go_shopping'
  resources :recipes do
    get 'execute'
      end
    end
  end
  
end