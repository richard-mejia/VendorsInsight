class CreateTelas < ActiveRecord::Migration
  def change
    create_table :telas do |t|
      t.string :tipo_tela

      t.timestamps null: false
    end
  end
end
