class CancionesController < ApplicationController
  before_action :auth_required, only: [:new, :create]
  skip_before_action :hook_urls, only: [:accion, :comentarios_json]

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

      @cancion.parrafos.create({texto: parrafo, posicion: parrafos_escritos})
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

  def comentarios_json
    @cancion = Cancion.find_by_id!(params[:cancion_id])
    @parrafo = @cancion.parrafos.find_by!(posicion: params[:parrafo_pos])
    @comentarios = @parrafo.comentarios
                       .order(:created_at => :desc)
                       .map { |comentario| mapear_comentario(comentario) }

    render json: @comentarios
  end

  def accion
    case params[:commit]
    when t('acciones.ver_comentarios')
      return comentarios
    when t('acciones.crear_comentario')
      return comentar
    else
      render :file => "public/404.html", :status => :unauthorized, :layout => false
    end
  end

  def enviar_correo
    @cancion = Cancion.find_by_id! params[:cancion_id]
  end

  private

  def mapear_comentario(comentario)
    {
        texto: Rack::Utils::escape_html(
            censurar_comentario(comentario.texto)),
        created_at: comentario.created_at
    }
  end

  def comentarios
    @cancion = Cancion.find_by_id!(params[:cancion_id])
    @parrafo = @cancion.parrafos.find_by!(posicion: params[:parrafo_pos])
    @comentarios = @parrafo.comentarios
                       .order(:created_at => :desc)
                       .map { |comentario| mapear_comentario(comentario) }

    render "comentarios/index"
  end

  def comentar
    @cancion = Cancion.find_by_id!(params[:cancion_id])
    @parrafo = @cancion.parrafos.find_by!(posicion: params[:parrafo_pos])
    @parrafo.comentarios.create({texto: params[:texto]})

    flash[:notice] = t('respuestas.comentario_creado')

    redirect_to cancion_url(@cancion, parrafo_pos: @parrafo.posicion)
  end

  def cancion_params
    params.require(:cancion).permit(:titulo, :artista, :imagen, :letra)
  end

  def censurar_comentario(texto)
    return texto unless ALM_CONFIG["habilitar_censura"]

    caracter_censura = ALM_CONFIG["caracter_censura"]

    insultos = Insulto.where("LOWER(:texto) LIKE CONCAT('%', LOWER(insulto), '%')",
                             {:texto => texto}).order("LENGTH(insulto) DESC").pluck(:insulto)

    insultos.each { |insulto| texto.gsub! /#{insulto}/i, caracter_censura * insulto.length }

    texto
  end
end