Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :locales do
    resources :monitoring_points do
      resources :monitoring_logs 
    end
  end
end