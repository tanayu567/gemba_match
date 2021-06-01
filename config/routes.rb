Rails.application.routes.draw do
  root 'top#index' 
  
  devise_for :users, 
    controllers: { registrations: 'registrations' } 
  
  devise_scope :user do
    get  'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
    
  resources :users, only: [:show]
  
end
