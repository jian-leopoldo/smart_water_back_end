Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :locales do
    get 'show_monitoring_points'
    resources :monitoring_points do
      get 'monitoring_logs_show'
      resources :monitoring_logs 
    end
  end
end