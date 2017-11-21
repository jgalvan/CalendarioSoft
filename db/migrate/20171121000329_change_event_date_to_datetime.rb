class ChangeEventDateToDatetime < ActiveRecord::Migration[5.1]
  def change
    remove_column :eventos, :fecha
    remove_column :eventos, :hora
    add_column :eventos, :fechaInicio, :datetime
    add_column :eventos, :fechaFin, :datetime
  end
end
