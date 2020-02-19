# Aylamusica

## Comandos

- Lanzar la aplicación

    ```bash
    rails server
    ```

- Crear canción manualmente

    ```bash
    rake app:create_song
    ```
  
- Volver a migrar desde cero
    
    ```bash
    rake db:migrate:redo
    ```

## Guías

- [introducción](https://guides.rubyonrails.org/getting_started.html)
- [bootstrap en rails](https://www.digitalocean.com/community/tutorials/how-to-add-bootstrap-to-a-ruby-on-rails-application)
- [asociaciones en rails](https://guides.rubyonrails.org/association_basics.html)
- [iguales en erb](https://stackoverflow.com/questions/3952403/without-equal-in-ruby-erb-means)
- [routing en rails](https://guides.rubyonrails.org/routing.html)
- [funciones de formulario](https://guides.rubyonrails.org/form_helpers.html)
- [tipos de datos en modelos](https://api.rubyonrails.org/v6.0.2.1/classes/ActiveRecord/ConnectionAdapters/SchemaStatements.html#method-i-add_column)
- [multiples modelos en formularios](https://stackoverflow.com/questions/32884412/how-to-handle-multiple-models-in-one-rails-form)
- [sesiones en rails](https://guides.rubyonrails.org/security.html)

## Próximas tareas

- Continuar con la implementación de bootstrap
- Implementar la imagen de las canciones
  - https://guides.rubyonrails.org/active_storage_overview.html
- Crear la página principal igual que el dibujo
- Crear configuración y página de login
    - https://www.justinweiss.com/articles/how-rails-sessions-work/
    - https://guides.rubyonrails.org/security.html
- ...