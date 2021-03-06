Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get 'users/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  #standard RESTful actions for sessions
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :users
  resources :account_activations, only: [:edit]

  #for mailer - email preview
  default_url_options :host => "example.com"

  #adding resource for password resets
  resources :password_resets,     only: [:new, :create, :edit, :update]
  #has create and destroy RESTful resources
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end




