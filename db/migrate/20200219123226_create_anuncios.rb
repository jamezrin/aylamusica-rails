class CreateAnuncios < ActiveRecord::Migration[6.0]
  def change
    create_table :anuncios do |t|
      t.string :url
      t.string :img_url
      t.string :correo
      t.integer :visitas

      t.timestamps
    end
  end
end
