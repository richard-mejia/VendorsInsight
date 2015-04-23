class Attachment < ActiveRecord::Base
  has_attached_file :archivo,
  :storage => :fog,
  :fog_credentials => {provider: 'AWS', 
    aws_access_key_id: '', 
    aws__secret_access_key: ''},
  :fog_directory => "Nombre de tu bucket"
end
