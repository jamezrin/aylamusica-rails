class PrincipalController < ApplicationController
  before_action :auth_required, only: [:salir]

  def index
    @canciones = Cancion
       .order(:visitas => :desc)
       .limit(ALM_CONFIG['mostrar_canciones_populares'])
  end

  def admin
    if request.post?
      @contrasena = params[:contrasena]
      if @contrasena == ALM_CONFIG['contrasena_admin']
        # login correcto
        session[:auth_timestamp] = Time.now
        redirect_to admin_path
      else
        # login incorrecto
        flash[:alert] = t('contrasena_incorrecta')
        redirect_to admin_path
      end

    else
      if session[:auth_timestamp]
        # sesión iniciada
        render 'principal/admin'
      else
        # sin sesión
        render 'principal/login'
      end
    end
  end

  def salir
    reset_session
    flash[:notice] = t('sesion_cerrada')
    redirect_to admin_path
  end

  def buscar
    @canciones = Cancion.where("artista LIKE :param_artista OR titulo LIKE :param_titulo",
       {:param_artista => "%#{params[:q]}%", :param_titulo => "%#{params[:q]}%"})
    render json: @canciones
  end
end
