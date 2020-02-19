class CreateComentarios < ActiveRecord::Migration[6.0]
  def change
    create_table :comentarios do |t|
      t.text :texto
      t.references :parrafo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
