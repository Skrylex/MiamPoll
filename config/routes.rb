Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  
  root :to => 'pages#home'

  devise_for :accounts, controllers: { sessions: "accounts/sessions", registrations: "accounts/registrations", passwords: "accounts/passwords" }
  
  resources :polls, only: %i[index show new create]
  resources :votes, only: %i[create update destroy]

  get "/polls/:id/close", to: "polls#close", as: :close_poll
  get "/polls/:id/open", to: "polls#open", as: :open_poll
end
