Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/' => 'environments#index'
  get '/environments' => 'environments#index'
  get '/environments/new' => 'environments#new'
  post '/environments' => 'environments#create'
  get '/environments/:id' => 'environments#show'
  get '/environments/:id/edit' => 'environments#edit'
  patch '/environments/:id' => 'environments#update'
  delete '/environments/:id' => 'environments#destroy'

  get '/note_pages/new' => 'note_pages#new'
  post '/note_pages' => 'note_pages#create'
  get '/note_pages/:id' => 'note_pages#show'
  get '/note_pages/:id/edit' => 'note_pages#edit'
  patch '/note_pages/:id' => 'note_pages#update'
  delete '/note_pages/:id' => 'note_pages#destroy'
end
