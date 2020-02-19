class AnunciosController < ApplicationController
  def new

  end

  def create
    render plain: params[:anuncio].inspect
  end
end
