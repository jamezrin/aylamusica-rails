class AnunciosController < ApplicationController
  before_action :auth_required

  def new
    @anuncio = Anuncio.new
  end

  def create
    @anuncio = Anuncio.new anuncio_params
    @anuncio.save
  end

  private

  def anuncio_params
    params.require(:anuncio).permit(:url, :correo, :imagen, :posicion)
  end
end
