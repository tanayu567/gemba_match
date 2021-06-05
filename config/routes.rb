Rails.application.routes.draw do
  root 'top#index'
  get 'spots/index'
  
  devise_for :users,
    controllers: { registrations: 'registrations' } 
  
  devise_scope :user do
    get  'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
    
  resources :users, only: [:show]
  resources :spots, only: [:show, :create, :destroy, :edit, :new]
  
end
