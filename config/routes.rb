Rails.application.routes.draw do
  root 'home#index'

  resources :providers do
    resources :contacts
  end

  resources :datacenters do
    resources :rooms do
      resources :racks
    end
  end
end
