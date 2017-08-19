Rails.application.routes.draw do
  resources :products

  # resources :cart, only: [:index, :destroy]

  resource :cart, only: [:show, :destroy] do
    post :add, path: "add/:id"
    # post :a2, path: ":id/add"
    # post :a3
  end
end
