class CancionesController < ApplicationController
  def new
    @cancion = Cancion.new
  end

  def create
    @cancion = Cancion.new cancion_params
    @cancion.save

    @cancion.letra.split("\r\n\r\n").each do |parrafo|
      next if parrafo.empty?

      @cancion.parrafos.create({ texto: parrafo })
    end

    render plain: params[:cancion].inspect
  end

  def show
    @cancion = Cancion.new cancion_params

  end

  private

  def cancion_params
    params.require(:cancion).permit(:titulo, :artista, :imagen, :letra)
  end
end