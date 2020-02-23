# Aylamusica

## Comandos

- Version de ruby: `2.6.3` con `bundler` instalado.
- Version de node: `v12.14.1` con `yarn` instalado.

### Preparación

```bash
bundle install
yarn install
rake db:create
rake db:migrate
```

### Lanzar la aplicación

```bash
rails server
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

## Próximas tareas
- [x] Continuar con la implementación de bootstrap
- [x] Implementar la imagen de las canciones
  - https://guides.rubyonrails.org/active_storage_overview.html
- [ ] Crear la página principal igual que el dibujo
- [ ] Crear configuración y página de login
    - https://www.justinweiss.com/articles/how-rails-sessions-work/
    - https://medium.com/@kristenfletcherwilde/saving-retrieving-data-with-a-yaml-file-in-ruby-the-basics-e45232903d94
    - https://guides.rubyonrails.org/security.html
- [ ] Renombrar acciones de los recursos
    - https://stackoverflow.com/questions/46340218/renaming-specific-path-on-resource-route
- [ ] Tratar los párrafos como radio buttons y usarlos en el formulario lateral
    - https://stackoverflow.com/questions/32935435/use-div-as-radio-button
- [ ] Hacer que las canciones sean `card` de bootstrap
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