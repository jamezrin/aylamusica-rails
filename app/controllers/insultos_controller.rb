class InsultosController < ApplicationController
  before_action :auth_required
  skip_before_action :force_maintenance

  def new
    @insulto = Insulto.new
  end

  def create
    @insulto = Insulto.new insulto_params
    @insulto.save

    flash[:notice] = t('insulto_creado')

    redirect_to admin_path
  end

  private

  def insulto_params
    params.require(:insulto).permit(:insulto)
  end
end
