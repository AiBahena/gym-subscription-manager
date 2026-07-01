Rails.application.routes.draw do
  root "subscribers#index"
  resources :subscribers do
    resources :payments, only: [:new, :create, :destroy]
  end
end
