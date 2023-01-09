Rails.application.routes.draw do
  resource :session, only: %i[new create destroy update]
  resources :users, param: :nickname, except: %i[index]

  root to: 'questions#index'

  resources :tags, only: %i[show], param: :name


  resources :questions do
    member do
      put :hide
    end
  end
end
