Rails.application.routes.draw do
  get 'cat_facts/index'
  get 'cat_facts/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
  get :about, to: 'welcome#about'
  get :contact, to: 'welcome#contact'

  resources :posts do
    resources :comments, except: :show
  end

  resources :categories, except: :show

  resources :posts do
    member do
      post 'publish'
    end
  end

  resources :posts, only: [:index]

  resources :feedbacks

  resources :feedbacks do
    resources :notes, except: :show
  end

  resources :cat_facts, only: [:index, :create, :destroy]

  namespace :api do
    namespace :v1 do
      resources :regions, only: [:index, :show] do
        resources :provinces, only: :index
      end

      resources :provinces, only: [:index, :show] do
        resources :cities, only: :index
      end

      resources :cities, only: [:index, :show] do
        resources :barangays, only: :index
      end

      resources :barangays, only: [:index, :show] do
      end

      resources :posts, only: [:index, :show]
    end
  end
end
