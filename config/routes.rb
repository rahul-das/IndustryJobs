Rails.application.routes.draw do
  resources :jobs
  # devise_for :users
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  resources :users
  root 'jobs#index'
end
