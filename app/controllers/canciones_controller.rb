class CancionesController < ApplicationController
  before_action :auth_required, only: [:new, :create]

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

    redirect_to cancion_url(@cancion)
  end

  def show
    @cancion = Cancion.find_by_id!(params[:id])

    # salvo que haya recargado la página, añadir una visita
    unless session[:previous_request_url] == session[:current_request_url]
      @cancion.visitas += 1
    end

    @cancion.save
  end

  private

  def cancion_params
    params.require(:cancion).permit(:titulo, :artista, :imagen, :letra)
  end
end