Rails.application.routes.draw do
  authenticated :admin do
    root 'dashboard#show', as: :authenticated_root
  end
  root to: "main#show"
  resources :patients
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
end
