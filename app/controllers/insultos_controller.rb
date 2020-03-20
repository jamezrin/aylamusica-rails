class InsultosController < ApplicationController
  before_action :auth_required

  def index
    @insulto = Insulto.new
  end

  def create
    @insulto = Insulto.new insulto_params
    @insulto.save

    flash[:notice] = t('respuestas.insulto_creado')

    redirect_to admin_url
  end

  private

  def insulto_params
    params.require(:insulto).permit(:insulto)
  end
end
