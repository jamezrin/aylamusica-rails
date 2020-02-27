Rails.application.routes.draw do
  get 'salir', to: 'principal#salir'
  match 'buscar', to: 'principal#buscar', :via => :get
  match 'admin', to: 'principal#admin', :via => [:get, :post]
  match 'admin/ver_log', to: 'admin#ver_log', :via => :get
  match 'admin/crear_log', to: 'admin#crear_log', :via => :get
  match 'admin/contrasena', to: 'admin#contrasena', :via => [:get, :post]
  match 'admin/inactividad', to: 'admin#inactividad', :via => [:get, :post]
  match 'admin/correo_masivo', to: 'admin#correo_masivo', :via => [:get, :post]
  match 'admin/import_export', to: 'admin#import_export', :via => [:get, :post]
  match 'admin/mantenimiento', to: 'admin#mantenimiento', :via => [:get, :post]

  resources :canciones do
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
