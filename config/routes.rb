Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :articles do
    resources :comments, only: [:create, :destroy]
    member do
      get 'destroy_confirmation'
    end
  end

  get 'my_profile', to: 'users#my_profile', as: 'my_profile'

  root 'articles#index'
end
