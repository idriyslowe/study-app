Rails.application.routes.draw do
  devise_for :users
    devise_scope :user do
      authenticated :user do
        root :to => 'environments#index', as: :authenticated_root
    end
      unauthenticated :user do
        root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end
  get '/environments' => 'environments#index'
  get '/environments/new' => 'environments#new'
  post '/environments' => 'environments#create'
  get '/environments/archived' => 'environments#archived'
  get '/environments/:id' => 'environments#show'
  get '/environments/:id/edit' => 'environments#edit'
  patch '/environments/:id' => 'environments#update'
  delete '/environments/:id' => 'environments#destroy'
  patch '/environments/:id/reactivate' => 'environments#reactivate'

  get '/note_pages' => 'note_pages#new'
  get '/note_pages/new' => 'note_pages#new'
  post '/note_pages' => 'note_pages#create'
  get '/note_pages/:id' => 'note_pages#show'
  get '/note_pages/:id/edit' => 'note_pages#edit'
  patch '/note_pages/:id' => 'note_pages#update'
  delete '/note_pages/:id' => 'note_pages#destroy'

  get '/bookmarks' => 'bookmarks#index'
  get '/bookmarks/new' => 'bookmarks#new'
  post '/bookmarks' => 'bookmars#create'
  get '/bookmarks/:id' => 'bookmarks#show'
  get '/bookmarks/:id/edit' => 'bookmarks#edit'
  patch '/bookmarks/:id' => 'bookmarks#update'
  delete '/bookmarks/:id' => 'bookmarks#destroy'

  get '/notes' => 'notes#index'
  get '/notes/new' => 'notes#new'
  post '/notes' => 'notes#create'
  get '/notes/:id' => 'notes#show'
  get '/notes/:id/edit' => 'notes#edit'
  patch '/notes/:id' => 'notes#update'
  delete '/notes/:id' => 'notes#destroy'

  post '/comments' => 'comments#create'
  delete '/comments/:id' => 'comments#destroy'

  namespace :api do
    get '/note_pages' => 'note_pages#index'
    get '/note_pages/new' => 'note_pages#new'
    post '/note_pages' => 'note_pages#create'
    get '/note_pages/:id' => 'note_pages#show'
    get '/note_pages/:id/edit' => 'note_pages#edit'
    patch '/note_pages/:id' => 'note_pages#update'
    delete '/note_pages/:id' => 'note_pages#destroy'

    get '/bookmarks' => 'bookmarks#index'
    get '/bookmarks/new' => 'bookmarks#new'
    post '/bookmarks' => 'bookmars#create'
    get '/bookmarks/:id' => 'bookmarks#show'
    get '/bookmarks/:id/edit' => 'bookmarks#edit'
    patch '/bookmarks/:id' => 'bookmarks#update'
    delete '/bookmarks/:id' => 'bookmarks#destroy'

    get '/notes' => 'notes#index'
    get '/notes/new' => 'notes#new'
    post '/notes' => 'notes#create'
    get '/notes/:id' => 'notes#show'
    get '/notes/:id/edit' => 'notes#edit'
    patch '/notes/:id' => 'notes#update'
    delete '/notes/:id' => 'notes#destroy'
  end
end
