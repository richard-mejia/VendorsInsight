class AddTipoPantalonToSolicituds < ActiveRecord::Migration
  def change
    add_column :solicituds, :tipo_pantalon, :string
  end
end
