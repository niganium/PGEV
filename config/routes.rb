Rails.application.routes.draw do
  

  resources :comments
  
  root :to =>'tops#index'

  get "tops/index" => "tops#index"

  resources :contacts

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    collection do
        post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]
  resources :joins, only: [:create, :destroy]

  resources :events do
      collection do
        post :confirm
      end
  end
  root to: 'events#index'
  get 'search', to: 'events#search'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
