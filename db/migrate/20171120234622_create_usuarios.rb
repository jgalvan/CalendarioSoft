class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :nombre
      t.string :apellidos
      t.string :contrasena
      t.string :type

      t.timestamps
    end
  end
end
