Rails.application.routes.draw do
  root 'top#index'
  get 'spots/index'
  
  
  devise_for :users,
    controllers: { registrations: 'registrations' } 
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  resources :spots do
    collection do
      get 'search'
    end
  end

  resources :users do
    collection do
      get 'search'
    end
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
    
  resources :users, only: [:show]
  resources :spots, only: [:show, :create, :destroy, :edit, :new]
  resources :relationships, only: [:create, :destroy]

  resources :spots do
    resources :likes, only: %i[create destroy]
  end
  
  resources :spots do
    resources :comments, only: [:create, :destroy]
  end
  
  
end
