Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions

  resources :questions do
    member do
      put '/questions/:id/hide', to: 'questions#hide', as: 'hide'
    end
  end
end
