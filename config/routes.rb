Flickrec::Application.routes.draw do
  resources :flickrecs, only: [:index, :create, :show]
  root "welcome#index"
end

