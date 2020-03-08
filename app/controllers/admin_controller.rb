class AdminController < ApplicationController
  before_action :auth_required
  skip_before_action :force_maintenance

  def mantenimiento
    ALM_CONFIG["mantenimiento"] =
        !ALM_CONFIG["mantenimiento"]
    save_alm_config

    if ALM_CONFIG["mantenimiento"]
      flash[:notice] = t('respuestas.mantenimiento_activado')
    else
      flash[:notice] = t('respuestas.mantenimiento_desactivado')
    end

    redirect_to :admin
  end

  def crear_log

  end

  def ver_log

  end

  # @todo improve this
  def contrasena
    if request.post?
      if ALM_CONFIG["contrasena_admin"] == params[:antigua_contrasena]
        if params[:nueva_contrasena] == params[:confirmacion_nueva_contrasena]
          ALM_CONFIG["contrasena_admin"] = params[:nueva_contrasena]
          save_alm_config

          flash[:notice] = t('contrasena_cambiada_correctamente')
        else
          flash[:alert] = t('confirmacion_contrasena_incorrecta')
        end
      else
        flash[:alert] = t('contrasena_incorrecta')
      end
    end
  end

  def inactividad
    if request.post?
      ALM_CONFIG["segundos_inaccion"] = params[:segundos_inaccion]
      save_alm_config

      flash[:notice] = t('segundos_inaccion_cambiado')
    end
  end

  def correo_masivo

  end

  def import_export

  end
end
