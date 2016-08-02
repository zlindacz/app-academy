Rails.application.routes.draw do

  resources :users, only: [:create, :destroy, :new, :update, :show, :index]
  resources :users do
    resources :contacts, only: :index
    resources :comments, only: :index
  end
  resources :contacts, only: [:create, :destroy, :new, :update, :show]
  resources :contacts do
    resources :comments, only: :index
  end
  resources :comments
  resources :contact_shares, only: [:create, :destroy]


  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show", as: 'user'
  # get "/users/new", to: "users#new", as: "new_user"
  # post "/users", to: "users#create"
  # delete "/users/:id", to: "users#destroy"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"
end
