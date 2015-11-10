Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :vendors
  resources :companies
  resources :payplans
  resources :quickbooks do
    collection do
      get :authenticate
      get :oauth_callback
      get :disconnect
    end
  end
  get 'about' => 'home#about'
  root to: 'vendors#index'
end
