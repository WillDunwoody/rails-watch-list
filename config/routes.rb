Rails.application.routes.draw do
  get '/', to: 'lists#index'
  resources :lists, only: [:index, :show, :new, :create] do
    resource :bookmarks, only: [:new, :create]
  end
end
