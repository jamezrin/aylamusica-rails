class CancionesController < ApplicationController
  def new

  end

  def create
    render plain: params[:cancion].inspect
  end
end
