Rails.application.routes.draw do
  default_url_options :host => "fast-depths-56174.herokuapp.com"
  resources :interviews
  resources :companies
  resources :job_applications do
    get 'set_response', on: :collection
    post 'save_response', on: :member
  end
  resources :jobs do
    get 'approve', on: :member
    get 'new_application', on: :member
    post 'apply', on: :member
  end
  # devise_for :users
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  resources :users
  resources :candidates
  root 'jobs#index'
end
