class AddParrafoToComentario < ActiveRecord::Migration[6.0]
  def change
    add_reference :comentarios, :parrafo, null: false, foreign_key: true
  end
end
