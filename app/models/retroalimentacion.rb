class Retroalimentacion < ApplicationRecord
  belongs_to :participante
  belongs_to :evento
end
