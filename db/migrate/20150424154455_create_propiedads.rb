class CreatePropiedads < ActiveRecord::Migration
  def change
    create_table :propiedads do |t|
      t.string :id_correo
      t.string :pass_correo
      t.string :id_amazon
      t.string :secreto_amazon

      t.timestamps null: false
    end
  end
end
