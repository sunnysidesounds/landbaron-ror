LandBaron::Application.routes.draw do
  # map.resource :investments

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:registrations => "devise_overrides/registrations"}

  root :to => "investments#index"
  
  devise_scope :user do
    authenticated :user do
      root :to => redirect('/investments'), as: :authenticated_root
    end

    unauthenticated do
      root :to => redirect('/users/sign_in'), as: :unauthenticated_root
    end
  end

  resources :investments do
    member do
      get :invest, as: :new_invest
    end
    collection do
      get 'my', to: :user_investments
    end
  end

  resources :quotes do
    
  end
  
  # root :to => "devise/sessions#new"

  # Deal Room
  match '/preorder'               => 'preorder#index', :via => [:get,:post]
  get 'preorder/checkout'
  match '/preorder/share/:uuid'   => 'preorder#share', :via => :get
  match '/preorder/ipn'           => 'preorder#ipn', :via => :post
  match '/preorder/prefill'       => 'preorder#prefill', :via => [:get,:post]
  match '/preorder/postfill'      => 'preorder#postfill', :via => [:get,:post]

  # Authentication
  # get 'sign_in' => 'authentication#sign_in'
  # post 'sign_in' => 'authentication#login'
  # get 'signed_out' => 'authentication#signed_out'
  # get 'change_password' => 'authentication#change_password'
  # get 'forgot_password' => 'authentication#forgot_password'
  # get 'new_user' => 'authentication#new_user'
  # post 'new_user' => 'authentication#register'
  # get 'password_sent' => 'authentication#password_sent'

  # My Account
  get 'account' => 'my_account#account'
  #Landing Page
  get 'investments' => 'investments#investment'
  # match 'investment_detail/:id'   => 'investments#investment_detail', :via => :get, as: 'investment_detail'
  # match 'invest/:id'   => 'investments#investment_now', :via => :get, as: 'new_invest'

  # quote
  # post 'quote' => 'quote#create_quote'
  # confirmation
  match 'confirmation/:id'   => 'investments#investment_confirmation', :via => :get


  # votes
  post 'vote' => 'vote#create_vote'


end



