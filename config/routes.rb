Rails.application.routes.draw do
  # get 'principal/index'
  get 'salir', to: 'principal#salir'
  match 'admin', to: 'principal#admin', :via => [:get, :post]
  match 'buscar', to: 'principal#buscar', :via => :post

  resources :canciones do
    resources :parrafos do
      resources :comentarios
    end
  end

  resources :insultos
  resources :anuncios

  root 'principal#index'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routi ng.html
end
