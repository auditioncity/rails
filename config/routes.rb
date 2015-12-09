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

  # CONTACT INFO
  post "actors/:actor_id/address", to: "actors#add_address"
  put "/actors/:actor_id/address/:type", to: "actors#update_address"
  post "/actors/:actor_id/email", to: "actors#add_email"
  put "/actors/:actor_id/email/:type", to: "actors#update_email"
  post "/actors/:actor_id/phone", to: "actors#add_phone"
  put "/actors/:actor_id/phone/:type", to: "actors#update_phone"
  post "/actors/:actor_id/url", to: "actors#add_url"
  put "/actors/:actor_id/url/:type", to: "actors#update_url"

end
