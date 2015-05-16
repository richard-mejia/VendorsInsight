class Solicitud < ActiveRecord::Base
 
  validates :cantidad, presence: true
  validates :tipo, presence: true
  validates :tipo_pantalon, presence: true
  validates :linea, presence: true
  validates :talla, presence: true
  


end
