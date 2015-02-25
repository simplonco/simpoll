Rails.application.routes.draw do
    root 'polls#index'
    resources :polls do
      resources :questions
    end
end
