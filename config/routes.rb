Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "admin/hotel#index"


  # devise_for :users, :sign_out_via => [ :get ]

  namespace :admin do
    resources :hotel
    resources :reserva
    resources :hospede
    resources :quarto
  end
  

end
