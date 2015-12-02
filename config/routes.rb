Rails.application.routes.draw do
  # USER ROUTES
  post "/signup", to: "registrations#create"
  delete "/signup", to: "registrations#destroy"
  post "/login", to: "registrations#login"

  # ACTOR ROUTES
  post "/actors/new", to: "actors#create"
  put "/actors/:id", to: "actors#update"
  get "/actors/:id", to: "actors#show"
  get "/actors", to: "actors#index"
  delete "/actors/:id", to: "actors#destroy"

end
