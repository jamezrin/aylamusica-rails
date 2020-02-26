class PrincipalController < ApplicationController
  before_action :auth_required, only: [:salir]
  before_action :auth_expire, only: [:admin]
  skip_before_action :force_maintenance, only: [:admin]

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
        session[:auth_timestamp] = Time.current
        render 'principal/admin'
      else
        # login incorrecto
        flash[:alert] = t('contrasena_incorrecta')
        render 'principal/login'
      end

    else
      if logged_in?
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
    if params[:q].empty?
      @canciones = Cancion.all
    else
      @canciones = Cancion.where("artista LIKE :param_artista OR titulo LIKE :param_titulo",
                                 {:param_artista => "%#{params[:q]}%", :param_titulo => "%#{params[:q]}%"})
    end
  end
end
