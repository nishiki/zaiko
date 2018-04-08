Rails.application.routes.draw do
  root 'home#index'

  resources :providers do
    resources :contacts
  end

  resources :datacenters
end
