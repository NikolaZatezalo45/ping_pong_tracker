Rails.application.routes.draw do
  get 'player_matches/index'
  resources :matches
  devise_for :users
  resources :players
  devise_scope :user do
    authenticated :user do
     root 'players#index', as: :authenticated_root
    end
    unauthenticated do
     root 'devise/sessions#new', as: :unauthenticated_root
   end
  end
end
