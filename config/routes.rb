Rails.application.routes.draw do

  get 'notifications/index'

  resources :poems, only: [:index, :show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # DIVE14: OAUTH
  devise_for :users, controllers: {
    # DIVE14: Normal User Signup needs unique string to avoid unique constraint violation
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  #DIVE16: Follow # Point is to describe this below devise_for clause
  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]

  #DIVE 19_1: Messaging 
  resources :conversations do
    resources :messages
  end

  resources :blogs do
    # DIVE15: Comment
    resources :comments
    post :confirm, on: :collection
  end
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end
  root 'top#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
