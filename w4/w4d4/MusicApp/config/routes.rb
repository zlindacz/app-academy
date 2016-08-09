Rails.application.routes.draw do
  root :to => 'sessions#new'

  resources :users, only: [:show, :new, :create]
  resource :session, only: [:new, :create, :destroy]


  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, except: :index do
    resources :tracks, only: :new
  end

  resources :tracks, except: :index
  resources :notes, only: :create
end
