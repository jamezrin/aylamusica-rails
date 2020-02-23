function fetchParrafo(posicion, callback) {
   $.ajax({
      url: window.location.pathname + '/comentarios',
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
   const camposParrafos = $('.cancion .parrafo input');
   const cacheParrafos = [];

   camposParrafos.on('change', function(event) {
      updateParrafos(cacheParrafos, event.target.value)
   });

   camposParrafos.each(function() {
      if (this.checked) {
         updateParrafos(cacheParrafos, this.value);
      }
   });
});
