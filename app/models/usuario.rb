class Usuario < ActiveRecord::Base
 # has_many :solicituds
  validates :correo, presence: true, format: { with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}/ }
  validates :correo, uniqueness: true
  
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
