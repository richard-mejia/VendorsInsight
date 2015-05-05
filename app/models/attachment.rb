class Attachment < ActiveRecord::Base
 do_not_validate_attachment_file_type :archivo
    config = Propiedad.first
 has_attached_file :archivo,
  :storage => :fog,
    :fog_credentials => {provider: 'Google', 
        google_storage_access_key_id: config.id_amazon, 
        google_storage_secret_access_key: config.secreto_amazon},
    :fog_directory => "imagenessolicitudes"
end
