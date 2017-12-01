class Usuario < ApplicationRecord 
    validates :nombre, :apellidos, :email, :contrasena, presence: true
    validates :email, uniqueness: true
    validates :contrasena, length: { minimum: 8 }
end
