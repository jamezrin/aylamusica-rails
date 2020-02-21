class AddPosicionToAnuncio < ActiveRecord::Migration[6.0]
  def change
    add_column :anuncios, :posicion, :integer
  end
end
