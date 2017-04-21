Rails.application.routes.draw do
  # get 'goals/index'
  #
  # get 'goals/new'
  #
  # get 'goals/create'
  #
  # get 'goals/edit'
  #
  # get 'goals/update'
  #
  # get 'goals/destroy'

  # get 'sessions/new'
  #
  # get 'sessions/create'
  #
  # get 'sessions/destroy'

  resource :sessions, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :edit, :update, :show]

  resources :goals, except: [:show]
  # get 'users/new'
  #
  # get 'users/create'
  #
  # get 'users/edit'
  #
  # get 'users/update'
  #
  # get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
