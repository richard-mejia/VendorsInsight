class Attachment < ActiveRecord::Base
  has_attached_file :archivo,
  :storage => :fog,
  :fog_credentials => {provider: 'AWS', 
    aws_access_key_id: 'AKIAI5HBYPNTFOMEDEJA', 
    aws__secret_access_key: '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'},
  :fog_directory => "Nombre de tu bucket"
end
