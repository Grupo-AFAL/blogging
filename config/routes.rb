Blogging::Engine.routes.draw do
  root to: 'posts#index'

  resources :posts, path: '/', only: %i[index show]
  resources :tags, only: %i[show]
end
