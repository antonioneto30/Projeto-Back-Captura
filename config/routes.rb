Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :answers #, only, %i[index create]
      resources :questions
      resources :formularies
      resources :visits
      resources :users
    end
  end
      post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
