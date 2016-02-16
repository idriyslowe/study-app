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
  post '/environments' => 'environments#create'
  get '/environments/archived' => 'environments#archived'
  get '/environments/:id' => 'environments#show'
  patch '/environments/:id' => 'environments#update'
  delete '/environments/:id/archive' => 'environments#archive'
  patch '/environments/:id/reactivate' => 'environments#reactivate'
  delete '/environments/:id' => 'environments#destroy'

  post '/note_pages' => 'note_pages#create'
  get '/note_pages/:id' => 'note_pages#show'
  patch '/note_pages/:id' => 'note_pages#update'
  delete '/note_pages/:id' => 'note_pages#destroy'

  get '/bookmarks/:id' => 'bookmarks#show'

  post '/comments' => 'comments#create'
  delete '/comments/:id' => 'comments#destroy'

  namespace :api do
    post '/notes' => 'notes#create'
    patch '/notes/:id' => 'notes#update'
    delete '/notes/:id' => 'notes#destroy'

    post '/bookmarks' => 'bookmarks#create'
    patch '/bookmarks' => 'bookmarks#update'
    delete '/bookmarks' => 'bookmarks#destroy'

    get '/note_pages' => 'note_pages#index'
    post '/note_pages' => 'note_pages#create'
    get '/note_pages/:id' => 'note_pages#show'
    patch '/note_pages/:id' => 'note_pages#update'
    delete '/note_pages/:id' => 'note_pages#destroy'
  end
end
