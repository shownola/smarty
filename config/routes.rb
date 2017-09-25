Rails.application.routes.draw do
  
  resources :topics do
    scope module: :topics do
      resources :posts, except: [:new, :create]
    end
  end
  
  get 'posts/new', to: 'topics/posts#new', as: 'new_post'
  post 'posts', to: 'topics/posts#create', as: 'create_post'
  
  # resources :posts
  # resources :topics
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'static#home'
end
