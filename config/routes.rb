Rails.application.routes.draw do
  resources :books, only: [:show] do
    resources :reviews
  end
end
