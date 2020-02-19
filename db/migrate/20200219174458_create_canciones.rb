class CreateCanciones < ActiveRecord::Migration[6.0]
  def change
    create_table :canciones do |t|
      t.string :artista
      t.string :titulo
      t.integer :visitas, default: 0
      t.string :img_url

      t.timestamps
    end
  end
end
