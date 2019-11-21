Rails.application.routes.draw do
  resources :cocktails, only: %i[show new create index] do
    resources :doses, only: %i[new create]
  end

  resources :doses, only: :destroy
end
