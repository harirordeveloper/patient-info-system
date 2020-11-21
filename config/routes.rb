Rails.application.routes.draw do
  root to: "dashboard#show"
  resources :patients
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
end
