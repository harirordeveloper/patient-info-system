Rails.application.routes.draw do
  authenticated :admin do
    root 'dashboard#show', as: :authenticated_root
  end
  root to: "main#show"
  resources :patients do
    member do
      delete :medical_record
    end
  end
  get "/upload" => 'patients#upload', as: :upload_patients
  post "/bulk_upload" => 'patients#bulk_upload', as: :bulk_upload_patients
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
end
