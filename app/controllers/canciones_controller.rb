class CancionesController < ApplicationController
  def new
    @cancion = Cancion.new
    @parrafos = @cancion.parrafos.build
  end

  def create
    @cancion = Cancion.new cancion_params
    @cancion.save
  end

  private
  def cancion_params
    params.require(:cancion).permit(:titulo, :artista)
  end
end