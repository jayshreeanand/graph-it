Rails.application.routes.draw do
  devise_for :users do
    root to: "devise/sessions#new"
  end

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :stories
end
