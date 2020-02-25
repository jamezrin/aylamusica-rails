class InsultosController < ApplicationController
  before_action :auth_required

  def new
    @insulto = Insulto.new
  end

  def create
    @insulto = Insulto.new params.require(:insulto).permit(:insulto)
    @insulto.save

    redirect_to admin_path
  end
end
