Rails.application.routes.draw do
  resources :imports, only: [:index, :show] do
    get :export, on: :collection
  end

  resources :customers, only: [:index, :show]
end
