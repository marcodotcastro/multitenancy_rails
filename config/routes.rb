Rails.application.routes.draw do
  constraints subdomain: /.*/ do
    resources :articles
  end
  resources :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
