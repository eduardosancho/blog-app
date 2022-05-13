Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # API
  scope :api, defaults: {format: :json } do
    scope :v1 do
      devise_for :users, as: 'api', controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/registrations' }

      resource :user, only: [:show, :update]

      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:index, :create, :show]
        end
      end
    end
  end
  # HTML
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end


  root "users#index"
end
