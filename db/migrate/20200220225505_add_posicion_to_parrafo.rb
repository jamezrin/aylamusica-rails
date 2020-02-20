class AddPosicionToParrafo < ActiveRecord::Migration[6.0]
  def change
    add_column :parrafos, :posicion, :integer
  end
end
