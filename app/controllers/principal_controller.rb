class PrincipalController < ApplicationController
  def index
    @canciones = Cancion.all
  end

  def admin

  end

  def salir

  end
end
