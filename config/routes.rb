Ingredients::Application.routes.draw do
  # OmniAuth
  root to: "recipes#index"
  match "/signin", to: "sessions#new", as: "new_session"
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  match "/signout", to: "sessions#destroy", :as => "signout"
  resources :identities

  resources :ingredients
  resources :recipes do
    resources :used_ingredients    
  end
end