# frozen_string_literal: true

require 'readline'

namespace :app do
  desc 'Importar canciones interactivamente'
  task create_song: :environment do
    artista = Readline.readline("Introduce el artista de la nueva canción:\n")
    titulo = Readline.readline("Introduce el titulo de la nueva canción:\n")

    song = Cancion.new({ artista: artista, titulo: titulo })

    puts 'Introduce la letra de la canción:'
    lineas = STDIN.read
    abort 'No se ha proporcionado nada por stdin' if lineas.empty?
    song.save

    parrafos_escritos = 0
    lineas.split("\n\n").each do |parrafo|
      next if parrafo.empty?

      parrafos_escritos += 1
      song.parrafos.create({ texto: parrafo })
    end

    puts "Se han escrito #{parrafos_escritos} párrafos a la canción #{titulo}"
  end
end
