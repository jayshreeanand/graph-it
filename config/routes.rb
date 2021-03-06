require 'resque_web'

Rails.application.routes.draw do
  mount ResqueWeb::Engine => '/resque_web'

  root 'stories#index'

  devise_for :users do
    root to: "devise/sessions#new"
  end

  devise_scope :user do
    authenticated :user do
      root 'stories#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :stories

  get '/explore' => 'stories#explore'

end
