Rails.application.routes.draw do

  resources :games do
    resources :scores
  end

  get '/users/new' => "users#new"
  post '/users' => "users#create"
  get 'users' => "users#index"
  root "users#index"

  get 'sessions/new' => 'sessions#new', as: 'log_in'
  post 'sessions' => 'sessions#create'

  get 'sessions/delete' => 'sessions#destroy'

  delete 'sessions' => 'sessions#destroy', as: 'log_out'

  get 'profiles' => 'profiles#index'

end
