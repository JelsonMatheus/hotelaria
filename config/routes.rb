Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect('/admin/hotel')


  # devise_for :users, :sign_out_via => [ :get ]

  namespace :admin do
    resources :hotel do
      get 'export', on: :collection
    end

    resources :reserva
    resources :hospede
    resources :quarto
  end
  

end
