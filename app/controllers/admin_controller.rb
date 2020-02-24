class AdminController < ApplicationController
  before_action :auth_required
  skip_before_action :force_maintenance

  def mantenimiento
    ALM_CONFIG["mantenimiento"] =
        !ALM_CONFIG["mantenimiento"]
    save_alm_config

    redirect_to :admin
  end
end
