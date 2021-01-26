Rails.application.routes.draw do
  constraints subdomain: /.*/ do
    resources :articles
  end

  resources :authors

  post 'user_token' => 'users/user_token#create'
  get 'refresh' => 'users/user_token#refresh'
end