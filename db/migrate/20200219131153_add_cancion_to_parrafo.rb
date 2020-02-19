class AddCancionToParrafo < ActiveRecord::Migration[6.0]
  def change
    add_reference :parrafos, :cancion, null: false, foreign_key: true
  end
end
