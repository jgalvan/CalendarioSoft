class Evento < ApplicationRecord
  belongs_to :administrador
  has_many :participacions
  has_many :participantes, through: :participacions

  validates :nombre, :lugar, :maxParticipantes, :descripcion, :fechaInicio, :fechaFin, presence: true
  validate :validarFechas 
  validates :maxParticipantes, numericality: { only_integer: true }

  def lugares_disponibles
    maxParticipantes - participantes.count
  end

  def validarFechas
    if fechaInicio.present? && fechaInicio < DateTime.now.change(offset: "0000")
      errors.add(:fechaInicio, :futura)
    end

    if fechaInicio.present? &&  fechaFin.present? && fechaInicio > fechaFin
      errors.add(:fechaFin, :fin_despues_incio)
    end
  end
end
