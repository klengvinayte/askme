Rails.application.routes.draw do
  resource :session, only: %i[new create destroy update]
  resources :users, param: :nickname, except: %i[index]

  root to: 'questions#index'

  resources :questions do
    member do
      put :hide
    end
  end
end
