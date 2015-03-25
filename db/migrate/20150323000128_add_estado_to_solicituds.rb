class AddEstadoToSolicituds < ActiveRecord::Migration
  def change
    add_column :solicituds, :estado, :integer
  end
end
