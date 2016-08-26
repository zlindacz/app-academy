Rails.application.routes.draw do
  namespace :api do
    resources :benches
  end
end
