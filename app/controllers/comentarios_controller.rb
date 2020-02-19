class ComentariosController < ApplicationController
  def new

  end

  def create
    render plain: params[:comentario].inspect
  end
end
