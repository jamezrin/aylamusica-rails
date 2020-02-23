const parrafos = [];

$('load', function() {
   $('.parrafo input').on('change', function(event) {
      const posicion = event.target.value;
      const contenido = parrafos[event.target.value];
      console.log(event.target.value)
   })
});