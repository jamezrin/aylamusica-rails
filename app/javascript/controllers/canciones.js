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
   const elAdvertenciaLista = $('#advertencia-lista');
   const elAdvertenciaListaTexto = $('#advertencia-lista__texto');

   listaComentarios.empty();
   if (comentarios.length > 0) {
      elAdvertenciaLista.hide();
      comentarios.forEach(comentario => {
         const textoComentario = comentario["texto"];
         const fechaCreacion = new Date(Date.parse(comentario["created_at"]));
         listaComentarios.append(`
            <li class="list-group-item">
               ${fechaCreacion.toLocaleString()}: ${textoComentario}
            </li>`
         );
      });
   } else {
      elAdvertenciaLista.show();
      elAdvertenciaListaTexto.html(elAdvertenciaListaTexto.attr('data-nocomments-text'));
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

   $('#ver-cancion form .parrafo input').on('change', function(event) {
      updateParrafos(cacheParrafos, event.target.value)
   });

   $('#ver-cancion form .parrafo input:checked').each(function() {
      updateParrafos(cacheParrafos, this.value);
   });
});
