class AddArchivoIdToSolicituds < ActiveRecord::Migration
  def change
    add_column :solicituds, :archivo_id, :int
  end
end
