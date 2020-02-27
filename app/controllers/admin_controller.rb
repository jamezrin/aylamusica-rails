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

  def contrasena

  end

  def inactividad

  end

  def correo_masivo

  end

  def import_export

  end
end
