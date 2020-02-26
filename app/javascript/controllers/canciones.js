function fetchParrafo(posicion, callback) {
   $.ajax({
      url: window.location.pathname + '/comentarios_json',
      type: 'POST',
      data: { parrafo_pos: posicion },
      success: callback
   });
}

function fillParrafos(comentarios) {
   const listaComentarios = $('#lista-comentarios');
   const elSinComentarios = $('#lista-comentarios + #lista-sin-comentarios');

   listaComentarios.empty();
   if (comentarios.length > 0) {
      elSinComentarios.hide();
      comentarios.forEach(comentario => {
         const textComentario = comentario["texto"];
         const fechaCreacion = new Date(Date.parse(comentario["created_at"]));
         listaComentarios.append(`
            <li class="list-group-item">
               ${fechaCreacion.toLocaleString()}: ${textComentario}
            </li>`
         );
      });
   } else {
      elSinComentarios.show();
   }
}

function updateParrafos(parrafos, posicion) {
   if (!parrafos[posicion]) {
      fetchParrafo(posicion, function(result) {
         parrafos[posicion] = result;
         fillParrafos(parrafos[posicion])
      })
   } else {
      fillParrafos(parrafos[posicion])
   }
}

$(document).on('turbolinks:load', function() {
   const cacheParrafos = [];

   $('.cancion .parrafo input').on('change', function(event) {
      updateParrafos(cacheParrafos, event.target.value)
   });

   $('.cancion .parrafo input:checked').each(function() {
      updateParrafos(cacheParrafos, this.value);
   });
});
