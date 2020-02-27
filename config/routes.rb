Rails.application.routes.draw do
  # get 'principal/index'
  get 'salir', to: 'principal#salir'

  match 'buscar', to: 'principal#buscar', :via => :get

  match 'admin', to: 'principal#admin', :via => [:get, :post]

  match 'admin/mantenimiento', to: 'admin#mantenimiento', :via => [:get, :post]
  match 'admin/crear_log', to: 'admin#crear_log', :via => :get
  match 'admin/ver_log', to: 'admin#crear_log', :via => :get

  resources :canciones do
    resources :parrafos do
      resources :comentarios
    end

    match 'accion', to: 'canciones#accion', :via => [:post]
    match 'comentarios_json', to: 'canciones#comentarios_json', :via => [:post]
    # match 'comentar', to: 'canciones#comentar', :via => [:post]
    # match 'comentarios', to: 'canciones#comentarios', :via => [:post]
  end

  resources :insultos
  resources :anuncios

  root 'principal#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routi ng.html
end
