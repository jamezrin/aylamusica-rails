class CreateParrafos < ActiveRecord::Migration[6.0]
  def change
    create_table :parrafos do |t|
      t.text :texto
      t.references :cancion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
