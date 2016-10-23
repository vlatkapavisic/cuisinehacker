Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout' }

  get '/about' => 'pages#about', as: 'about'
  get '/search' => 'recipes#search', as: 'search'
  get '/posts-archive' => 'posts#archive', as: 'posts_archive'
  get '/a-moveable-feast' => 'places#map', as: 'places_map'
  get '/recipes/category/:category' => 'recipes#category_show', as: 'recipes_category'

  resources :recipes
  resources :categories, only: :show
  resources :posts
  resources :places
end
