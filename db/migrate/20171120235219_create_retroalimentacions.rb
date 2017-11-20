class CreateRetroalimentacions < ActiveRecord::Migration[5.1]
  def change
    create_table :retroalimentacions do |t|
      t.string :comentarios
      t.references :participante, foreign_key: true
      t.references :evento, foreign_key: true

      t.timestamps
    end
  end
end
