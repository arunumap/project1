Flickrec::Application.routes.draw do
  resources :flickrec, only: [:index, :show]
  resources :users, except: [:index]
end
