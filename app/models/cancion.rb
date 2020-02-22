class Cancion < ApplicationRecord
  has_many :parrafos, :dependent => :destroy

  has_one_attached :imagen

  # atributo virtual
  attr_accessor :letra
end
