class Cancion < ApplicationRecord
  has_many :parrafos
  accepts_nested_attributes_for :parrafos
end
