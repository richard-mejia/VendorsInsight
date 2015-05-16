class Tela < ActiveRecord::Base
    validates :tipo_tela, presence: true
end
