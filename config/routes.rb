Rails.application.routes.draw do
  resource :session, only: %i[new create destroy update]
  resources :users, only: %i[new create edit update destroy]

  root to: 'questions#index'

  resources :questions do
    member do
      put :hide
    end
  end
end
