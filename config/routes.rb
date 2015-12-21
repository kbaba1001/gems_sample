Rails.application.routes.draw do
  namespace :api, format: :json do
    resources :books, only: %i(create)
  end
end
