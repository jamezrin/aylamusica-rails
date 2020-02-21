class AnunciosController < ApplicationController
  def new
    @anuncio = Anuncio.new
  end

  def create
    @anuncio = Anuncio.new anuncio_params
  end

  private

  def anuncio_params
    params.require(:anuncio).permit(:url, :correo, :imagen, :posicion)
  end
end
