# Aylamusica

## Comandos

- Version de ruby: `2.6.3` con `bundler` instalado.
- Version de node: `v12.14.1` con `yarn` instalado.
- Opcional: Foreman o Overmind instalados, para ejecutar el `Procfile`

### Preparación

```bash
bundle install
yarn install
rake db:create
rake db:migrate
```

### Lanzar la aplicación

```bash
foreman start
```

### Crear canción manualmente

```bash
rake app:create_song
```
  
### Volver a migrar desde cero
    
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
- [selects en rails](https://guides.rubyonrails.org/form_helpers.html#select-boxes-for-dealing-with-model-objects)

### Otros enlaces
- https://apidock.com/rails/ActiveRecord/QueryMethods/order
- https://prathamesh.tech/2019/08/26/understanding-webpacker-in-rails-6/
- `IMPORTANTE` https://gilesbowkett.com/posts/2019/05/06/webpacker.html
- https://rossta.net/blog/from-sprockets-to-webpack.html

## Próximas tareas
- [x] Continuar con la implementación de bootstrap
- [x] Implementar la imagen de las canciones
  - https://guides.rubyonrails.org/active_storage_overview.html
- [x] Crear la página principal igual que el dibujo
- [x] Crear configuración y página de login
    - https://www.justinweiss.com/articles/how-rails-sessions-work/
    - https://medium.com/@kristenfletcherwilde/saving-retrieving-data-with-a-yaml-file-in-ruby-the-basics-e45232903d94
    - https://guides.rubyonrails.org/security.html
- [ ] Renombrar acciones de los recursos
    - https://stackoverflow.com/questions/46340218/renaming-specific-path-on-resource-route
- [x] Tratar los párrafos como radio buttons y usarlos en el formulario lateral
    - https://stackoverflow.com/questions/32935435/use-div-as-radio-button
- [x] Hacer que las canciones sean `card` de bootstrap
- [ ] Validar campos en el servidor
    - https://stackoverflow.com/questions/2823628/rails-how-to-require-at-least-one-field-not-to-be-blank 
- [ ] Utilizar cookies para no usar parámetros de url
    - Al usar parámetros de url la primera vez que comentas se añade una visualización, ya que cambia la URL
    - Se puede utilizar para `parrafo_pos` y para `locale`
- [ ] Eliminar required del campo de texto del comentario para que cuando se desactive el javascript se puedan 
      ver los comentarios
- [x] Añadir el atributo alt a las imágenes
- ...

## Accesibilidad

- Todas las imágenes tienen que tener un `alt`
- Los headers tienen que estar en orden (h1, h2, h3...)
- Usar elementos de html5 como aside, section, etc.
- Añadir atributos ARIA
- https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles/Main_role
- https://www.bignerdranch.com/blog/web-accessibility-skip-navigation-links/

## Notas

- Color de ilustraciones `#3BD4C1`