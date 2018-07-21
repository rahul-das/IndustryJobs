Rails.application.routes.draw do
  resources :job_applications
  resources :jobs do
    get 'approve', on: :member
    get 'new_application', on: :member
    post 'apply', on: :member
  end
  # devise_for :users
  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  resources :users
  resources :candidates
  root 'jobs#index'
end
