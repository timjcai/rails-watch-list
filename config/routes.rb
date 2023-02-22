Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/movies', to: 'movies#index'
  # get 'lists/new', to: 'lists#new'
  # post 'lists', to: 'lists#create'
  # get '/lists', to: 'lists#index'
  # get '/lists/:id', to: 'lists#show', as: 'list'
  # # EDIT
  # #delete list
  # delete '/lists/:id', to: 'lists#destroy'
  resources :lists do
    resources :bookmarks, only: %i[new create index show]
  end
  resources :bookmarks, only: [:destroy]
end
