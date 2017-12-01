class CreateParticipacions < ActiveRecord::Migration[5.1]
  def change
    create_table :participacions do |t|
      t.references :evento, foreign_key: true
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
