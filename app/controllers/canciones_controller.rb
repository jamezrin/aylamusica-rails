class CancionesController < ApplicationController
  before_action :auth_required, only: [:new, :create]
  skip_before_action :hook_urls, only: [:comentar, :comentarios]

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

  def comentar
    @cancion = Cancion.find_by_id!(params[:cancion_id])
    @parrafo = @cancion.parrafos.find_by!(posicion: params[:parrafo_pos])
    @parrafo.comentarios.create({ texto: params[:texto] })

    flash[:notice] = t('comentario_creado')

    # TODO: utilizar cookies para no usar parametros de url
    # al usar parametros de url la primera vez que comentas se añade una visualización
    redirect_to cancion_url(@cancion, parrafo_pos: @parrafo.posicion)
  end

  def comentarios
    @cancion = Cancion.find_by_id!(params[:cancion_id])
    @parrafo = @cancion.parrafos.find_by!(posicion: params[:parrafo_pos])
    render json: @parrafo.comentarios.map { |comentario|
      {
        texto: censurar_comentario(comentario.texto),
        created_at: comentario.created_at
      }
    }
  end

  private

  def cancion_params
    params.require(:cancion).permit(:titulo, :artista, :imagen, :letra)
  end

  def censurar_comentario(texto)
    caracter_censura = ALM_CONFIG["caracter_censura"]

    insultos = Insulto.select(:insulto).where(":texto LIKE CONCAT('%', insulto, '%')",
         {:texto => texto }).pluck(:insulto)

    insultos.each do |insulto|
      texto.gsub! insulto, caracter_censura * insulto.length
    end

    texto
  end
end