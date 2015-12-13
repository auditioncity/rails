Rails.application.routes.draw do
  # USERS (Authentication)
  post "/signup", to: "registrations#create"
  delete "/signup", to: "registrations#destroy"
  post "/login", to: "registrations#login"

  # ACTORS
  post "/actors/new", to: "actors#create"
  put "/actors/:id", to: "actors#update"
  get "/actors/:id", to: "actors#show"
  get "/actors", to: "actors#index"
  delete "/actors/:id", to: "actors#destroy"

  # CONTACT INFO FOR ACTORS
  post "/actors/:actor_id/address", to: "actors#add_address"
  put "/actors/:actor_id/address/:old_type", to: "actors#update_address"
  delete "/actors/:actor_id/address/:type", to: "actors#delete_address"


  post "/actors/:actor_id/email", to: "actors#add_email"
  put "/actors/:actor_id/email/:old_type", to: "actors#update_email"
  delete "/actors/:actor_id/email/:type", to: "actors#delete_email"

  post "/actors/:actor_id/phone", to: "actors#add_phone"
  put "/actors/:actor_id/phone/:old_type", to: "actors#update_phone"
  delete "/actors/:actor_id/phone/:type", to: "actors#delete_phone"

  post "/actors/:actor_id/url", to: "actors#add_url"
  put "/actors/:actor_id/url/:old_type", to: "actors#update_url"
  delete "/actors/:actor_id/url/:type", to: "actors#delete_url"

  put "/actors/:actor_id/primary/:contact_type", to: "actors#update_primary"

  # DIRECTORS

  post "/directors/new", to: "directors#create"
  put "/directors/:id", to: "directors#update"
  get "/directors/:id", to: "directors#show"
  get "/directors", to: "directors#index"
  delete "/directors/:id", to: "directors#destroy"

  # DECISIONS

  post "/directors/:id/decisions/new", to: "decisions#create"
  put "/directors/:id/decisions/:id", to: "decisions#update"
  get "/directors/:id/decisions/:decision_id", to: "decisions#show"
  get "/directors/:id/decisions", to: "decisions#index"
  delete "/directors/:id/decisions/:decision_id", to: "decisions#destroy"

end
