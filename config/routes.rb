Rails.application.routes.draw do
  root :to => "dashboard#index"

  resources :repository_searches

  get "/:username/repository_issues/:id" => "repository_issues#index", :as => :repository_issue
end
