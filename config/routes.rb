Rails.application.routes.draw do
  root :to => "dashboard#index"

  resources :repository_searches
end
