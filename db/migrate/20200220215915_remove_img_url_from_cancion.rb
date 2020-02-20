class RemoveImgUrlFromCancion < ActiveRecord::Migration[6.0]
  def change

    remove_column :canciones, :img_url, :string
  end
end
