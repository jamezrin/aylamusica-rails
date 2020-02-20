class PrincipalController < ApplicationController
  def index
    @canciones = Cancion
       .order(:visitas => :desc)
       .limit(ALM_CONFIG['mostrar_canciones_populares'])
  end

  def admin
    if request.post?
      @contrasena = params.permit(:contrasena)
      if @contrasena == ALM_CONFIG['contrasena_admin']
        # login correcto
        session[:timestamp] = Time.now
        redirect_to admin_path
      else
        # login incorrecto
        redirect_to admin_path
      end

    else
      if session[:timestamp]
        # sesión iniciada
        render 'principal/admin'
      else
        # sin sesión
        render 'principal/login'
      end
    end
  end

  def salir
    reset_session if session[:timestamp]
    redirect_to root_path
  end

  def buscar
    @canciones = Cancion.where("artista LIKE :param_artista OR titulo LIKE :param_titulo",
       {:param_artista => "%#{params[:busqueda]}%", :param_titulo => "%#{params[:busqueda]}%"})
    render json: @canciones
  end
end
