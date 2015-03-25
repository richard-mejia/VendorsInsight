class Solicitud < ActiveRecord::Base
 
  validates :cantidad, presence: true
  validates :tipo, presence: true


end
