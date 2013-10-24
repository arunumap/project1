Flickrec::Application.routes.draw do
  resources :flickrec, only: [:index, :show]
  resources :users, except: [:index]
  resources :movies, only: [:create]
end
