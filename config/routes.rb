Rails.application.routes.draw do
# config/routes.rb
Rails.application.routes.draw do
  resources :users
  resources :matches do
    resources :registrations, only: [ :create, :destroy ]
  end

  root "matches#index"
end
end
