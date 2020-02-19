class Parrafo < ApplicationRecord
  belongs_to :cancion
  has_many :comentarios
end
