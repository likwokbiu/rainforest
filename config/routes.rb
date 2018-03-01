Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

  resources :products do
    resources :reviews, except: [:index, :new, :show]
  end

  resource :users, only: %i(new create)

  resource :sessions, only: %i(new create destroy)

end
