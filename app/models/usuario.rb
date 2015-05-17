class Usuario < ActiveRecord::Base
 # has_many :solicituds
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :cedula, presence: true
  validates :tipo_usuario, presence: true
  validates :clave, presence: true
  validates :correo, presence: true, format: { with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}/ }
  validates :correo, uniqueness: true
  validates :cedula, uniqueness: true
  
    def self.autenticar(cedula, clave)
		usuario =Usuario.find_by cedula: cedula
		
		if usuario
			if usuario.clave == clave
				return usuario
			end
		end
		return nil

		#return unless user
		#return user if user.password == User.encrypt(password, user.salt)
	end
	
end
