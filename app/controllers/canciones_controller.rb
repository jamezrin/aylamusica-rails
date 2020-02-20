class CancionesController < ApplicationController
  def new
    @cancion = Cancion.new
  end

  def create
    @cancion = Cancion.new cancion_params
    @cancion.save

    parrafos_escritos = 0
    @cancion.letra.split("\r\n\r\n").each do |parrafo|
      next if parrafo.empty?
      parrafos_escritos += 1

      @cancion.parrafos.create({ texto: parrafo, posicion: parrafos_escritos })
    end

    render plain: params[:cancion].inspect
  end

  def show
    @cancion = Cancion.find_by_id(params[:id])
  end

  private

  def cancion_params
    params.require(:cancion).permit(:titulo, :artista, :imagen, :letra)
  end
end