class AdminController < ApplicationController
  def mantenimiento
    ALM_CONFIG["mantenimiento"] = !ALM_CONFIG["mantenimiento"]
    save_alm_config

    redirect_to :admin
  end
end
