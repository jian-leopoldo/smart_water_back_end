Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post :login , to: 'application#login'
  resources :users
  post '/create_user', to: 'users#create_user'
  resources :locales do
    get 'show_monitoring_points'
    resources :monitoring_points do
      resources :alerts
      get 'monitoring_logs_show'
      resources :monitoring_logs 
    end
  end
end