Rails.application.routes.draw do
  get "students/index"
  get "students/show"
  get "students/create"
  get "authentication/login"
  post '/auth/login', to: 'authentication#login'
  resources :students, only: [:index, :show, :create]
  get "up" => "rails/health#show", as: :rails_health_check


end
