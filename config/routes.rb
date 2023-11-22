Rails.application.routes.draw do
  get "/registration", to: "registrations#new", as: :sign_up
  post "/registration", to: "registrations#create", as: :registration

  delete "/sign_out", to: "sessions#destroy", as: :sign_out
  get "/sign_in", to: "sessions#new", as: :sign_in
  post "/sign_in", to: "sessions#create", as: :sign_in_create

  post "/password_recover", to: "passwords#create"
  get "/password_recover", to: "passwords#edit"
  get "/new_password/:id", to: "passwords#new", as: "new_password"
  put "/password_update/:id", to: "passwords#update", as: "password_update"
  root "site#index"
end
