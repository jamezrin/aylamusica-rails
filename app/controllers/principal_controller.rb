class PrincipalController < ApplicationController
  def index
    @canciones = Cancion.all
  end
end
