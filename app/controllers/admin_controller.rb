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
    if request.post?

    end
  end

  def ver_log
    if request.post?

    end
  end

  def contrasena
    if request.post?
      antigua_contrasena = params[:antigua_contrasena]
      nueva_contrasena = params[:nueva_contrasena]
      confirmacion_nueva_contrasena = params[:confirmacion_nueva_contrasena]

      if ALM_CONFIG["contrasena_admin"] == antigua_contrasena
        if nueva_contrasena == confirmacion_nueva_contrasena
          if nueva_contrasena.match(/[A-Z]/) && nueva_contrasena.match(/[a-z]/) &&
              nueva_contrasena.match(/[0-9]/) && nueva_contrasena.match(/[@!$&%^*()#]/)
            ALM_CONFIG["contrasena_admin"] = nueva_contrasena
            save_alm_config

            flash[:notice] = t('contrasena_cambiada_correctamente')
            flash[:alert] = nil
          else
            flash[:notice] = nil
            flash[:alert] = t('contrasena_insegura')
          end
        else
          flash[:notice] = nil
          flash[:alert] = t('confirmacion_contrasena_incorrecta')
        end
      else
        flash[:notice] = nil
        flash[:alert] = t('contrasena_incorrecta')
      end
    end
  end

  def cambiar_censura
    caracter_censura = params[:caracter_censura]
    ALM_CONFIG["caracter_censura"] = caracter_censura
    save_alm_config

    flash[:notice] = t('caracter_censura_cambiado')
    redirect_to insultos_url
  end

  def cambiar_inactividad
    if request.post?
      ALM_CONFIG["segundos_inaccion"] = params[:segundos_inaccion].to_i
      save_alm_config

      flash[:notice] = t('segundos_inaccion_cambiado')
    end

    @tiempo_inactividad = ALM_CONFIG["segundos_inaccion"]
  end

  def correo_masivo
    if request.post?

    end
  end

  def import_export
    if request.post?

    end
  end
end
