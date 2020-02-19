class Cancion < ApplicationRecord
  has_many :parrafos

  attr_accessor :letra
end
