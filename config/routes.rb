Rails.application.routes.draw do
  # USER ROUTES
  post "/signup", to: "registrations#create"
  delete "/signup", to: "registrations#destroy"
  post "/login", to: "registrations#login"
end
