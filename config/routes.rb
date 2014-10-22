Rails.application.routes.draw do
  root :to => "repository_searches#new"

  resources :repository_searches

  get "/:username/repository_issues/:id" => "repository_issues#index", :as => :repository_issues
  post "/:username/repository_issues/:id" => "repository_issues#create"
end
