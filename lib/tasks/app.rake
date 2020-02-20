# frozen_string_literal: true

require 'readline'

namespace :app do
  desc 'Importar canciones interactivamente'
  task create_song: :environment do
    artista = Readline.readline("Introduce el artista de la nueva canción:\n")
    titulo = Readline.readline("Introduce el titulo de la nueva canción:\n")

    puts 'Introduce la letra de la canción:'; lineas = STDIN.read
    abort 'No se ha proporcionado nada por stdin' if lineas.empty?
    cancion = Cancion.create({ artista: artista, titulo: titulo })

    parrafos_escritos = 0
    lineas.split("\n\n").each do |parrafo|
      next if parrafo.empty?

      cancion.parrafos.create({ texto: parrafo, posicion: parrafos_escritos })
      puts "Escrito párrafo #{parrafos_escritos += 1}: #{parrafo}"
    end

    puts "Se han escrito #{parrafos_escritos} párrafos a la canción #{titulo}"
  end

  desc 'Actualizar las posiciones de los párrafos'
  task update_songs: :environment do
    canciones = Cancion.all.includes(:parrafos)

    canciones.each do |cancion|
      puts "Actualizando #{cancion.artista} - #{cancion.titulo}"
      cancion.parrafos.each_with_index do |parrafo, indice|
        parrafo.posicion = indice + 1
        parrafo.save
      end
    end

    puts "Se han actualizado los párrafos #{canciones.count} canciones"
  end
end
