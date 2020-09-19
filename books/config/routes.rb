Rails.application.routes.draw do
  root 'demo#index'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :books do
    member do
      get :delete
    end
  end

  get 'demo/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
