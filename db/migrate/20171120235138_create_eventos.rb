class CreateEventos < ActiveRecord::Migration[5.1]
  def change
    create_table :eventos do |t|
      t.date :fecha
      t.time :hora
      t.string :nombre
      t.string :lugar
      t.integer :maxParticipantes
      t.string :descripcion
      t.references :administrador, foreign_key: true

      t.timestamps
    end
  end
end
