class Evento < ApplicationRecord
  belongs_to :administrador
  has_many :participacions
  has_many :participantes, through: :participacions

  def lugares_disponibles
    maxParticipantes - participantes.count
  end
end
