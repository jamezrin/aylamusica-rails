class InsultosController < ApplicationController
  before_action :auth_required

  def new
    @insulto = Insulto.new
  end

  def create
    @insulto = Insulto.new insulto_params
    @insulto.save

    flash[:notice] = t('insulto_creado')

    redirect_to admin_url
  end

  private

  def insulto_params
    params.require(:insulto).permit(:insulto)
  end
end
