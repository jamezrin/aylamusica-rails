class ParrafosController < ApplicationController
  def new

  end

  def create
    render plain: params[:parrafo].inspect
  end
end
