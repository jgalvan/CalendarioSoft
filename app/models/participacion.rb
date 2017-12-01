class Participacion < ApplicationRecord
  belongs_to :evento
  belongs_to :participante, class_name: 'Participante', foreign_key: 'usuario_id'
end
