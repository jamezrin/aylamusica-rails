class AnunciosController < ApplicationController
  before_action :auth_required, except: [:show]

  def new
    @anuncio = Anuncio.new
    @ultima_posicion = Anuncio.maximum(:posicion) || -1
    @anuncio.posicion = @ultima_posicion + 1
  end

  def create
    @anuncio = Anuncio.new anuncio_params
    @anuncio.save

    flash[:notice] = t('respuestas.anuncio_creado')

    redirect_back fallback_location: admin_url
  end

  def show
    @anuncio = Anuncio.find_by_id! params[:id]
    @anuncio.visitas += 1
    @anuncio.save

    redirect_to @anuncio.url
  end

  private

  def anuncio_params
    params.require(:anuncio).permit(:url, :correo, :imagen, :posicion)
  end
end
