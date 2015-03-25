class Solicitud < ActiveRecord::Base
  belongs_to :usuarios
  validates :cantidad, presence: true
  validates :tipo, presence: true


  def vendedor
	#return self.id
  end

end
