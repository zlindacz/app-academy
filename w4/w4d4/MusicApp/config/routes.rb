Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: :new
  end

  resources :albums, except: :index do
    resources :tracks, only: :new
  end

  resources :tracks, except: :index
end
