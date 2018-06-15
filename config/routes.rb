Rails.application.routes.draw do
  match "/contact", to: "pages#contact", via: :get
  get "/about", to: "pages#about"
  root "pages#index"
end
