class RemoveImgUrlFromAnuncio < ActiveRecord::Migration[6.0]
  def change

    remove_column :anuncios, :img_url, :string
  end
end
