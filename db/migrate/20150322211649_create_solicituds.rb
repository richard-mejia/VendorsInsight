class CreateSolicituds < ActiveRecord::Migration
  def change
    create_table :solicituds do |t|
      t.date :fecha
      t.references :vendedor, index: true
      t.string :cliente
      t.references :disenador, index: true
      t.string :linea
      t.string :tipo
      t.boolean :set_tallas
      t.boolean :contramuestra
      t.string :referencia
      t.integer :talla
      t.boolean :muestra_tela
      t.string :nombre_tela
      t.boolean :adjunto
      t.integer :cantidad
      t.string :especificacion

      t.timestamps null: false
    end
    add_foreign_key :solicituds, :usuarios
    add_foreign_key :solicituds, :usuarios
  end
end
