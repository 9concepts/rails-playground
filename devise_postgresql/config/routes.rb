Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  root "top#index"

  devise_scope :user do
    get 'login', to: 'users/sessions#new', as: :new_user_session
    post 'login', to: 'users/sessions#create', as: :user_session
    delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  get 'github', to: 'searches#index'
  get 'github/search', to: 'searches#search'
end
