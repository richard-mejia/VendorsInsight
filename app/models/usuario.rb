class Usuario < ActiveRecord::Base
  has_many :solicituds
  validates :correo, presence: true, format: { with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}/ }
  validates :correo, uniqueness: true
  
	
end
