Rails.application.routes.draw do
  resources :poems, only: [:index, :show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # DIVE14: OAUTH
  devise_for :users, controllers: {
    # DIVE14: Normal User Signup needs unique string to avoid unique constraint violation
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      post :confirm
    end
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
