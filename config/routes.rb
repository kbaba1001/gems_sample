Rails.application.routes.draw do
  resources :books, only: %i(create)
end
