class Participante < Usuario
    has_many :participacions, foreign_key: 'usuario_id'
end
